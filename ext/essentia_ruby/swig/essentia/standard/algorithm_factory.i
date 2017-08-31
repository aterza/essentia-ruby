//
// SWIG Wrapper for essentia's AlgorithmFactory class
//
%{
  #include "algorithmfactory.h"
%}

%include "algorithmfactory.h"

//%extend essentia::EssentiaFactory<essentia::standard::Algorithm> {
// EssentiaFactory<essentia::standard::Algorithm>() { essentia::init(); }
// // ~EssentiaFactory<essentia::standard::Algorithm>() { essentia::shutdown(); }
//}
//
//%extend essentia::EssentiaFactory<essentia::streaming::Algorithm> {
// EssentiaFactory<essentia::streaming::Algorithm>() { essentia::init(); }
// // ~EssentiaFactory<essentia::streaming::Algorithm>() { essentia::shutdown(); }
//}

%template(AlgorithmFactory) essentia::EssentiaFactory<essentia::standard::Algorithm>;
%template(StreamingAlgorithmFactory) essentia::EssentiaFactory<essentia::streaming::Algorithm>;
