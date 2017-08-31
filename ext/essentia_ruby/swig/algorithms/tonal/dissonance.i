//
// SWIG Wrapper for essentia's Dissonance class
//
%module "essentia::algorithms::tonal"
%{
  #include "tonal/dissonance.h"
%}

%rename(StreamingDissonance) essentia::streaming::Dissonance;

%include "tonal/dissonance.h"
