//
// SWIG Wrapper for essentia's Dissonance class
//
%{
  #include "dissonance.h"
%}

%rename(StreamingDissonance) essentia::streaming::Dissonance;

%include "dissonance.h"
