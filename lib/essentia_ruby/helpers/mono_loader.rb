module EssentiaRuby
  module Helpers

    module MonoLoader
      #
      # <tt>mono_loader(filename, sample_rate = 44100.0, mix = 'mix')</tt>
      #
      # reads an audio file from +filename+, downmixes to mono, resamples it if
      # the input sample rate does not match the desired output sample rate.
      #
      # mix can be 'left', 'right' or 'mix' (default)
      #
      def mono_loader(filename, sample_rate = 44100.0, mix = 'mix')
        af = EssentiaRuby::AlgorithmFactory.instance
        fn = EssentiaRuby::Parameter.new(filename)
        sr = EssentiaRuby::Parameter.new(sample_rate)
        mx = EssentiaRuby::Parameter.new(mix)
  
        af.create('MonoLoader', 'filename', fn, 'sampleRate', sr, 'downmix', mx)
      end
    end

  end
end

