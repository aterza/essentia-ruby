module Essentia
  module Helpers

    module CommonCreator

      class << self

        def create(algo, om = Essentia::Models::OptionManager.new)
          params = om.has_key?(algo) ? om[algo].to_essentia_parameters : []
          Essentia::StreamingAlgorithmFactory.instance.create(algo, *params)
        end

      end

    end

  end
end
