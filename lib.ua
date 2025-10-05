# Experimental!

ToFreq ← ×₄₄₀˜ⁿ2÷₁₂ # 0=A=440 1=A#=466...
# makes a rest
# ? length
Rest ← (
  ÷⟜(⇡⁅×)&asr
  ⊞×1
)
Normalize ← ˜÷⟜(⊢⍆) # resacales an array to be within [-1, 1]
SynBase! ← (
  ÷⟜(⇡⁅×)&asr  # make the list for sound
  ToFreq ⊃⋅∘⊙◌ # convert notes to freqs
  ⊞×           # apply freqs to lists
  ^0
  ⊂Rest 0.01                            # add a short rest so different notes are audible
)                                       # a base for all synthisizers
FreqSynBase!  ← ^0˜⊞×÷⟜(⇡⁅×)&asr        # similar to SYNBASE but doesnt have the rest or the defined otes instead give frequencies inhz 
Syn           ← SynBase!(∿×π)           # a sine wave synthisizer. first arg is time, second is notes
SawSyn        ← SynBase!(◿₁)            # a sawtooth synthiszer
SquareSyn     ← SynBase!(±∿×π)          # a squarewave synthisizer
TriSyn        ← SynBase!(-₁×₂⌵-₁◿₁)     # a triangle wave synthisizer
FifthWave     ← ◌/+⊃(SawSyn⊙+₅)(SawSyn) # plays a note and the note above it. makes a strange warm sound
FreqSyn       ← FreqSynBase!(∿×π)
FreqSawSyn    ← FreqSynBase!(◿₁)
FreqSquareSyn ← FreqSynBase!(±∿×π)
FreqTriSyn    ← FreqSynBase!(-₁×₂⌵-₁◿₁)

# a simple envelope
# ? attack stop, decay start, note or audioclip
Envelope ← (
  ⊙⊙⊸(÷⟜⇡⧻)                  # make array from 0-1 of same size as audio array
  ◡(+⊃(>⊙◌)(>◌))             # figure out which function to use
  ×⨬(×⨪⊙◌|1⋅⋅◌|+₁×⊙-⨪-₁.⋅⊙∘) # make array of weights and multiply
)
# a synth organ
Organ ← (
  ⊃≡Syn≡TriSyn ↯6⊙(+[12 24 3 39 43 46])
  /+⊂∩(÷[1 1 1 2 2 2])
  Normalize
)
