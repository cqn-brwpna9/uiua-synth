TOFREQ ← ×440˜ⁿ2÷12 # 0=A=440 1=A#=466...
REST ← (
  ÷⟜(⇡⁅×)&asr
  ⊞×1
)
SYNBASE! ← (
  ÷⟜(⇡⁅×)&asr # make the list for sound
  TOFREQ :    # convert notes to freqs
  ⊞×          # apply freqs to lists
  ^0
  ⊂REST 0.01 # add a short rest so different notes are audible
)
SYN       ← (SYNBASE!(∿×π))              # a sine wave synthisizer. first arg is time, second is notes
SAWSYN    ← (SYNBASE!(◿1))               # a sawtooth synthiszer
SQUARESYN ← (SYNBASE!(=⊃⌊∘÷2⌊))          # a sinewave synthisizer
FIFTHWAVE ← (◌/+⊃(SAWSYN⊙(+ 5))(SAWSYN)) # plays a note and the note above it. makes a strange warm soind
ENVFUNC ← (
  ⨬(×÷1|1|+1×⊃(¯÷:1-1◌)-)◡(+⊙:⊃(<⊙:)<)
)
ENVELOPE ← (
  ◡(÷⟜(⇡)⧻)
  ⊙(⨬(×÷1|1|+1×⊃(¯÷:1-1◌)-)◡(+⊙:⊃(<⊙:)<))
  ⊙(◌◌◌)×
) # apply an envelope to a audio clip args: audio attack[0,d) decay[a,1) NOT QUITE RIGHT
ENVELOPE (SQUARESYN 3 1) 0.1 0.8

