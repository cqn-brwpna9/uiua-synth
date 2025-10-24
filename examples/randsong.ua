# Experimental!
Synth ~ "../lib.ua"
  Syn      ← Synth~Syn
  Rest     ← Synth~Rest
  Envelope ← Synth~Envelope
R        ← ⊡⌊×⚂˜⊙∘⟜(⧻)
N        ← [12 10 7 5 3 0 ¯2 ¯5 ¯7 ¯9]     # c major pentatonic scale
T        ← [1 0.5 0.5 0.5 0.25 0.25 0.125] # varios note times
E        ← ˜Envelope +×0.5⚂⟜∘ ×0.2⚂
Seq′     ← ⍥(⊂E Syn R T R N)+2⁅×3⚂E Syn R T R N                    # a shorter sequence no rest
Seq″     ← ⍥(⊂⨬(E Syn R T R N)(Rest R T)<0.05⚂)+5⁅×5⚂E Syn R T R N # longer seq
⍥(
  ⨬(
    ⨬(
      E Syn R T R N
    )(
      ⨬Seq′ Seq″<0.25⚂
    )<0.05⚂
  )(
    Rest R T
  )<0.05⚂
  ⊂
)100 0
&ap
