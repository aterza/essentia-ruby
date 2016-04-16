#
# +AlgorithmFactory+ and +StreamingAlgorithmFactory
#
# This class (along with its sibling, +StreamingAlgorithmFactory+) is a
# de-facto singleton class already in C++. However, the 'singletoneness' of
# the class in C++ does not seem to be strong enough (algorithms get
# re-registered when the class is re-created), so we make a strong ruby
# Singleton class for it.
#
require 'singleton'

module Essentia_ruby # this has to match the SWIG class one

  class AlgorithmFactory
    include Singleton
  end

  class StreamingAlgorithmFactory
    include Singleton
  end

end
