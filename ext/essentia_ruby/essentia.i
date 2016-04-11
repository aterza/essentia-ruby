//
// SWIG Wrapper for essentia
//
%include "typemaps.i"
%module essentia_ruby
%{
  #include "essentia.h"
%}

%include  "config.h"
%include std_vector.i

%include "types.i"
%include "parameter.i"
%include "configurable.i"
// %include "algorithm.i"
// %include "streamingalgorithmwrapper.i"
// %include "dissonance.i"
