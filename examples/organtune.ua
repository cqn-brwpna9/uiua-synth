# this has no relation to heaven help us by mcr
# Experimental!
Synth ~ "../lib.ua"
  Organ     ← Synth~Organ
  Normalize ← Synth~Normalize
  ToNote    ← Synth~ToNote

Dual ← ⊙◌Normalize+∩Organ ⊃⊙⋅∘⊙⊙∘ ⊙∩ToNote # plays two notes at the same time

&ap ⊂₉ Dual1.5"bn3""cn3" Organ 0.5 ToNote"an3" Dual1.5"bn3""gs2" Dual0.5"bn3""fn2" Dual1"dn3""fn2" Dual0.5"an3""fn2" Dual0.5"dn3""fn2" Dual1"cn3""dn2" Dual1"bn3""gs2"
