//
// SWIG Wrapper for essentia's Dissonance class
//
%module essentia_ruby
%{
  #include "dissonance.h"
%}

%include "config.h"
%include "configurable.h"
%include "algorithm.h"
%include "streaming/streamingalgorithmwrapper.h"
%include "dissonance.h"
