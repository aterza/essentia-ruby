

<CsoundSynthesizer>
<CsOptions>
-odac
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

instr 2
kamp = p4
kfreq = p5
audio1 oscil kamp, kfreq,1
out audio1
endin 



</CsInstruments>
<CsScore>
f1 0 4096 10 1 [1/2] [1/3] [1/4] [1/5] [1/6] [1/7] [1/8] [1/9] [1/10] [1/11] [1/12] [1/13] [1/14]
i1 0 10 .8 1000
i2 0 1  .8 2000
i2 + 1  .8 1078.3
i2 + 1  .8 2000
i2 + 1  .8 1078.3
i2 + 1  .8 2000
i2 + 1  .8 1078.3
i2 + 1  .8 2000
i2 + 1  .8 1078.3
i2 + 1  .8 2000
i2 + 1  .8 1078.3

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>380</width>
 <height>205</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>230</r>
  <g>140</g>
  <b>36</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
