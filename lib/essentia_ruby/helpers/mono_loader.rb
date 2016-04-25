module EssentiaRuby
  module Helpers

    module MonoLoader

      DEFAULT_MONOLOADER_OPTIONS = { 'sampleRate' => 44100, 'downmix' => 'mix' }

      def create_mono_loader(filename, options = {})
        options.update('filename' => filename)
        EssentiaRuby::Helpers::CommonCreator.create('MonoLoader', options, DEFAULT_MONOLOADER_OPTIONS)
      end
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
        ml = create_mono_loader(filename, 'sampleRate' => sample_rate, 'downmix' => mix)
        audio_buffer = EssentiaRuby::RealVector.new
  
        ml.output('audio').set_real_vector(audio_buffer)

        ml.compute

        audio_buffer
      end
    end

  end
end

