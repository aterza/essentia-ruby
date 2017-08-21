module EssentiaRuby
  module Helpers

    module CommonCreator

      class << self

        def create(algo, om = EssentiaRuby::OptionManager.new)
          params = om.has_key?(algo) ? om[algo].to_essentia_parameters : []
          Essentia_ruby::StreamingAlgorithmFactory.instance.create(algo, *params)
        end

      end

    end

  end
end
