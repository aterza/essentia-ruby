//
// SWIG Wrapper for essentia's DevNull algorithm class
//
// We must %ignore the NOWHERE and DEVNULL enums and recreate
// them in another way (directly in ruby)
//
%rename(connect_to_devnull) essentia::streaming::connect(SourceBase&, DevNullConnector);

%{
  // #include "streaming/sink.h"
  #include "streaming/algorithms/devnull.h"
%}

%include "streaming/algorithms/devnull.h"

// %template(RealVectorDevNull) essentia::streaming::DevNull<std::vector<essentia::Real>>;
