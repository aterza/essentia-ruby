//
// SWIG Wrapper for essentia's Algorithm class
//
%module essentia_ruby
%{
  #include "streaming/streamingalgorithmwrapper.h"
%}

%include "algorithm.h"

namespace essentia {
  namespace standard {
    class Algorithm;
  }
}

%include "streaming/streamingalgorithmwrapper.h"
