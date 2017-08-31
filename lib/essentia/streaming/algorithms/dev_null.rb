#
# +DevNull+
#
# The DevNull model is a garbage sink. We need here to specify it here
# because we need the NOWHERE and DEVNULL constants.
# NOWHERE and DEVNULL are the same single immutable sink where all the
# unwanted output falls into oblivion.

module Essentia

  module Streaming

    module Algorithms

      # NOWHERE = DEVNULL = Essentia::RealVectorDevNull.new.freeze.input('data')

    end

  end

end
