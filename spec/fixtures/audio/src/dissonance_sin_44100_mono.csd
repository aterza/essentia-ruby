<CsoundSynthesizer>
<CsOptions>
-dWo ../dissonance_sin_44100_mono.wav
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 10
nchnls = 1
0dbfs = 1

instr 1 
kamp = p4
kfreq = p5
audio oscil kamp,kfreq,1
out audio
endin


</CsInstruments>
<CsScore>
f1 0 4096 10 1
i1 0 10 .5 1000
i1 0 1  .5 2000
i1 + 1  .5 1078.3
i1 + 1  .5 2000
i1 + 1  .5 1078.3
i1 + 1  .5 2000
i1 + 1  .5 1078.3
i1 + 1  .5 2000
i1 + 1  .5 1078.3
i1 + 1  .5 2000
i1 + 1  .5 1078.3

</CsScore>
</CsoundSynthesizer>
