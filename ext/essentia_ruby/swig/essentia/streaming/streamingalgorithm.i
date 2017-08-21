//
// SWIG Wrapper for essentia's Algorithm class
//
// %module essentia_ruby
%{
  #include "streaming/sinkbase.h"
  #include "streaming/streamingalgorithm.h"
%}

%ignore essentia::streaming::operator>>;

%rename(StreamingAlgorithm) essentia::streaming::Algorithm;

namespace essentia {
  namespace streaming {

    %rename(connect_source_and_sink) connect(SourceBase&, SinkBase&);
    %rename(connect_sink_and_source) connect(SinkBase&, SourceBase&);
    %rename(disconnect_source_and_sink) disconnect(SourceBase&, SinkBase&);
    %rename(connect_source_and_sink_algos) connect(Algorithm*, const std::string&, Algorithm*, const std::string&);

  }
}

%include "streaming/streamingalgorithm.h"
