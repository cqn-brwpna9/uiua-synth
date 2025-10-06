# Experimental!
# a synthisizer library for uiua

# converts a note from a stringified form to a note for ToFreq
# note looks like "<a|b|c|d|e|f|g><b|n|s><octave number>"
# ie "An4" or "Cs3"
# not case sensitive
ToNote ← +⊃(°¤+˜⊏0_2_3_5_7_8_10⊚="ABCDEFG"⌵⊙(-₁⊚="BNS"⌵)⊢₂|×₁₂-₄⋕⊣)
ToFreq ← ×₄₄₀˜ⁿ2÷₁₂ # 0=A=440 1=A#=466...
# makes a rest
# ? length
Rest ← (
  ÷⟜(⇡⁅×)&asr
  ⊞×1
)
Normalize ← ˜÷⟜(⊢⍆) # resacales an array to be within [-1, 1]
SynBase! ← (
  ÷⟜(⇡⁅×)&asr # make the list for sound
  ⊙ToFreq     # convert note to freqs
  ˜⊞×         # apply freqs to lists
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
# apply over or undertones to a synthisizer at various volumens
# ? (synth|over or undertones offsets|voulmes for each over/undertone) length note
Overtones‼! ← (
  ≡^0↯⧻^1⊙(+^1)
  /+×^2
  Normalize
)
# a synth organ
Organ ← (
  ⊃(Overtones‼!(TriSyn|[12 24 3 39 43 46]|[1 1 1 0.5 0.5 0.5])|Overtones‼!(Syn|[12 24 3 39 43 46]|[1 1 1 0.5 0.5 0.5]))
  Normalize+
)
