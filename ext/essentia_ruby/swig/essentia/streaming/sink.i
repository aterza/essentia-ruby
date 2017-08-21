//
// SWIG Wrapper for essentia's Sink class
//
%{
  #include "streaming/sinkbase.h"
  #include "streaming/sink.h"
%}

%include "streaming/sinkbase.h"
%include "streaming/sink.h"

%template(RealVectorSink) essentia::streaming::Sink<std::vector<essentia::Real>>;
