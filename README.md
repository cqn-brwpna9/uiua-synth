#uiua-synth
`uiua-synth` is a library for the [Uiua](https://uiua.org) programing language that is used to synthisize audio.
This library is currently in very early stages of development and some functions(`ENVELOPE`) do not work properly.
It can be imported using:
```uiua
synth~"git: github.com/cqn-brwpna9/uiua-synth"
```
##functions
|name|arguments|description|
|---|---|---|
|`TOFREQ`|`note`|Converts a note to a frequency. 0=440 hz, every change by 1 is a semitone|
|`REST`|`length`|Makes a silent audio clip that is `length` seconds long|
|`SYN`|`length` `note`|Makes a sine wave audio clip that is `length` seconds long with a tone of `note`. `note` is passed to `TOFREQ` before it is processed|
|`SAWSYN`|`length` `note`|Very similar to `SYN` but uses a sawtooth wave|
|`SQUARESYN`|`length` `note`|Very similar to `SYN` but uses a square wave|
|`FIFTHWAVE`|`length` `note`|A synthisizer that is 2 sawtooth waves added together one 5 semitones higher than the other|
|`ENVELOPE`|`audio` `attack` `decay`|Applies a envelope to `audio`. `attack` is how far into the function the audio reaches its full volume. `decay` is when the audio starts going to zero|
|`SYNBASE!`|`function` `length` `note`|A synthiszer base that doesnt include the identifying function for what type of sound it is. Use `∿×π` for a sine wave.

