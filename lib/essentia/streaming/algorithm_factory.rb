#
# +Streaming::AlgorithmFactory
#
# This class (along with its sibling, +StreamingAlgorithmFactory+) is a
# de-facto singleton class already in C++. However, the 'singletoneness' of
# the class in C++ does not seem to be strong enough (algorithms get
# re-registered when the class is re-created), so we make a strong ruby
# Singleton proxy class for it.
#
require 'singleton'

module Essentia # this has to match the SWIG class one

  module Streaming

    class AlgorithmFactory
      include Singleton
  
      #
      # +create+
      #
      # This is just a convenience method to be able to use +create+
      # directly from the instance without recurring to the class method
      #
      # Differently from +essentia+, this +AlgorithmFactory+ is a class
      # of the +Essentia::Streaming+ module.
      #
      def create(*args)
        Essentia::StreamingAlgorithmFactory.create(*args)
      end
    end

  end

end
