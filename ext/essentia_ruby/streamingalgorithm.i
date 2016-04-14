//
// SWIG Wrapper for essentia's Algorithm class
//
// %module essentia_ruby
%{
  #include "streaming/sinkbase.h"
  #include "streaming/streamingalgorithm.h"
%}

%rename(StreamingAlgorithm) essentia::streaming::Algorithm;

%include "streaming/streamingalgorithm.h"
