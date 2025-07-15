SYNTH ~ "synth.ua"
  SYN   ← SYNTH~SYN
  REST  ← SYNTH~REST
R     ← ⊡⌊×⚂:⟜(⧻)
N     ← [12 10 7 5 3 0 ¯2 ¯5 ¯7 ¯9]                         # c major pentatonic scale
T     ← [1 0.5 0.5 0.5 0.25 0.25 0.125]                     # varios note times
SEQI  ← ⍥(⊂SYN R T R N)+2⁅×3⚂SYN R T R N                    # a shorter sequence no rest
SEQII ← ⍥(⊂⨬(SYN R T R N)(REST R T)<0.05⚂)+5⁅×5⚂SYN R T R N # longer seq
⍥(
  ⨬(
    ⨬(
      SYN R T R N
    )(
      ⨬SEQI SEQII<0.25⚂
    )<0.05⚂
  )(
    REST R T
  )<0.05⚂
  ⊂
)100 0
