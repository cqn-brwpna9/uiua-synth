# uiua-synth
`uiua-synth` is a library for the [Uiua](https://uiua.org) programing language that is used to synthisize audio.
This library is currently in very early stages of development.
It can be imported using:
```uiua
synth~"git: github.com/cqn-brwpna9/uiua-synth"
```
## functions
|name|arguments|description|
|---|---|---|
|`ToFreq`|`note`|Converts a note to a frequency. 0=440 hz, every change by 1 is a semitone|
|`Rest`|`length`|Makes a silent audio clip that is `length` seconds long|
|`Syn`|`length` `note`|Makes a sine wave audio clip that is `length` seconds long with a tone of `note`. `note` is passed to `ToFreq` before it is processed then a short rest is added to the end|
|`SawSyn`|`length` `note`|Very similar to `Syn` but uses a sawtooth wave|
|`SquareSyn`|`length` `note`|Very similar to `Syn` but uses a square wave|
|`FifthWave`|`length` `note`|A synthisizer that is 2 sawtooth waves added together one 5 semitones higher than the other|
|`Envelope`|`audio` `attack` `decay`|Applies a envelope to `audio`. `attack` is how far into the function the audio reaches its full volume. `decay` is when the audio starts going to zero. A graph of it looks like this:  [graph](https://www.desmos.com/calculator/7affkwgfo2)|
|`SynBase!`|`function` `length` `note`|A synthiszer base that doesnt include the identifying function for what type of sound it is. Use `∿×π` for a sine wave.|
|`FreqSynBase!`|`function` `length` `note`|`SynBase` without passing to `ToFreq` or adding a short rest on the end|
|`FreqSyn`,`FreqSawSyn` and `FreqSquareSyn`|`length` `note`|Similar to `Syn`, `SawSyn` and `SquareSyn` but using `FreqSynBase!`.|
|`Organ`|`length` `note`|Similar to a synthisizer, but plays an organ-like sound.|
