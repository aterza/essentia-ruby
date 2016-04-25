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
      # it returns the audio buffer loaded
      #
      def mono_loader(filename, sample_rate = 44100.0, mix = 'mix')
        af = EssentiaRuby::AlgorithmFactory.instance
        fn = EssentiaRuby::Parameter.new(filename)
        sr = EssentiaRuby::Parameter.new(sample_rate)
        mx = EssentiaRuby::Parameter.new(mix)
        audio_buffer = EssentiaRuby::RealVector.new
  
        ml = af.create('MonoLoader', 'filename', fn, 'sampleRate', sr, 'downmix', mx)
        ml.output('audio').set_real_vector(audio_buffer)

        ml.compute

        audio_buffer
      end
    end

  end
end

