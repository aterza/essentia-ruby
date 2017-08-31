//
// SWIG farm for the Essentia::Streaming::Algorithms module
//
%module "essentia::streaming::algorithms"
%{
  #include  "config.h"
  #include "essentia.h"
%}

%include std_vector.i

%import "essentia/pool.i"
%import "essentia/streaming/source.i"

%include "essentia/streaming/algorithms/poolstorage.i"
%include "essentia/streaming/algorithms/devnull.i"
