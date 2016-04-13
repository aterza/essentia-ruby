//
// SWIG Wrapper for essentia
//
%module essentia_ruby
%define EssentiaRuby essentia_ruby
%enddef

%{
  #include "essentia.h"
%}

%include  "config.h"
%include std_vector.i

%include "types.i"
%include "iotypewrappers.i"
%include "parameter.i"
%include "configurable.i"
%include "algorithm.i"
// %include "streamingalgorithm.i"
// %include "streamingalgorithmwrapper.i"
// %include "dissonance.i"
