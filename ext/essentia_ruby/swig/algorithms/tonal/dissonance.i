//
// SWIG Wrapper for essentia's Dissonance class
//
%{
  #include "tonal/dissonance.h"
%}

%rename(StreamingDissonance) essentia::streaming::Dissonance;

%include "tonal/dissonance.h"
