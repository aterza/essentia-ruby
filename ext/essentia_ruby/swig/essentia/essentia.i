//
// wrapper for essentia general calls
//
%{
  #include "config.h"
  #include "essentia.h"
%}

%import "types.h"

%ignore essentia::standard::registerAlgorithm();
%ignore essentia::streaming::registerAlgorithm();

%rename(is_initialized) essentia::isInitialized();
 
%include "config.h"
%include "essentia.h"
