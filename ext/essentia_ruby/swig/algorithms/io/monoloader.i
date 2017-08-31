//
// SWIG Wrapper for essentia's MonoLoader class
//
%module "essentia::algorithms::io"

%{
  #include "io/monoloader.h"
%}

%rename(StreamingMonoLoader) essentia::streaming::MonoLoader;

%include "io/monoloader.h"
