module EssentiaRuby
  module Helpers

    module CommonCreator

      class << self

        def create(algo, options = {}, default_options = {})
          opts = Marshal.load(Marshal.dump(default_options)) # deep hash copy
          opts.merge!(options)
          parms = {}
          opts.each { |k, v| parms.update(k => EssentiaRuby::Parameter.new(v)) }
          EssentiaRuby::AlgorithmFactory.instance.create(algo, *(parms.map { |k, v| [k, v] }.flatten))
        end

      end

    end

  end
end
