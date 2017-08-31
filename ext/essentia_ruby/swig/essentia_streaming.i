//
// SWIG farm for the Essentia::Streaming module
//
%module "essentia::streaming"
%{
  #include "essentia.h"
  #include "iotypewrappers.h"
%}

%include  "config.h"
%include std_vector.i

%import "essentia/types.i"
%import "essentia/parameter.i"
%import "essentia/standard/iotypewrappers.i"


// %include "essentia/streaming/sourcebase.i"
// %include "essentia/streaming/sinkbase.i"
%include "essentia/streaming/multiratebuffer.i"
%include "essentia/streaming/source.i"
%include "essentia/streaming/sink.i"
%include "essentia/streaming/streamingalgorithm.i"
%include "essentia/streaming/streamingalgorithmwrapper.i"
