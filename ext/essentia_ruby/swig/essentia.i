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

%include "essentia/types.i"
%include "essentia/exception.i"
%include "essentia/iotypewrappers.i"
%include "essentia/parameter.i"
// %include "essentia/pool.i" // this does not work
%include "essentia/configurable.i"
%include "essentia/algorithm.i"
%include "essentia/algorithm_factory.i"
%include "essentia/streaming/sourcebase.i"
%include "essentia/streaming/streamingalgorithm.i"
%include "essentia/streaming/streamingalgorithmwrapper.i"
%include "algorithms/tonal/dissonance.i"
%include "algorithms/io/monoloader.i"
