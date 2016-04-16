//
// SWIG Wrapper for essentia's MonoLoader class
//
%{
  #include "io/monoloader.h"
%}

%rename(StreamingMonoLoader) essentia::streaming::MonoLoader;

%include "io/monoloader.h"

