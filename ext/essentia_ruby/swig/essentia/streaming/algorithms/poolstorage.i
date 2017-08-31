//
// SWIG Wrapper for essentia's PoolConnector class
//

//
// abstract base class which is not groked by the swig wrappers
//
%ignore essentia::streaming::PoolStorageBase;

%{
  #include "streaming/sourcebase.h"
  #include "streaming/algorithms/poolstorage.h"
%}

%include "streaming/algorithms/poolstorage.h"
