//
// SWIG Wrapper for essentia's Source class
//
%{
  #include "connector.h"
  #include "streaming/sourcebase.h"
  #include "streaming/source.h"
%}
  
%include "connector.h"
%include "streaming/sourcebase.h"
%include "streaming/source.h"

%template(RealVectorSource) essentia::streaming::Source<std::vector<essentia::Real>>;
