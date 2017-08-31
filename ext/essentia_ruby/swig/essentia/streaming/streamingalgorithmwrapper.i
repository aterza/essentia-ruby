//
// SWIG Wrapper for essentia's StreamingAlgorithm class
//
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
