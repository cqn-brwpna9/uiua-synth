TOFREQ ← ×440˜ⁿ2÷12 # 0=A=440 1=A#=466...
#makes a rest
# ? length
REST ← (
  ÷⟜(⇡⁅×)&asr
  ⊞×1
)
SYNBASE! ← (
  ÷⟜(⇡⁅×)&asr # make the list for sound
  TOFREQ :    # convert notes to freqs
  ⊞×          # apply freqs to lists
  ^0
  ⊂REST 0.01                                 # add a short rest so different notes are audible
)                                            # a base for all synthisizers
FREQSYNBASE!  ← (^0 ⊞× : ÷⟜(⇡⁅×)&asr)        # similar to SYNBASE but doesnt have the rest or the defined otes instead give frequencies inhz 
SYN           ← (SYNBASE!(∿×π))              # a sine wave synthisizer. first arg is time, second is notes
SAWSYN        ← (SYNBASE!(◿1))               # a sawtooth synthiszer
SQUARESYN     ← (SYNBASE!(=⊃⌊∘÷2⌊))          # a sinewave synthisizer
FIFTHWAVE     ← (◌/+⊃(SAWSYN⊙(+ 5))(SAWSYN)) # plays a note and the note above it. makes a strange warm sound
FREQSYN       ← (FREQSYNBASE!(∿×π))
FREQSAWSYN    ← (FREQSYNBASE!(◿1))
FREQSQUARESYN ← (FREQSYNBASE!(=⊃⌊∘÷2⌊))
# a simple envelope
# ? attackstop decaystart noteoroaudioclip
ENVELOPE ← (
  ⊙⊙⊸(÷⟜⇡⧻)                  # make array from 0-1 of same size as audio array
  ◡(+⊃(>⊙◌)(>◌))             # figure out which function to use
  ×⨬(×⨪⊙◌|1⋅⋅◌|+1×⊙-⨪-1.⋅⊙∘) # make array of weights and multiply
)
