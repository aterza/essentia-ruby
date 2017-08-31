module Essentia
  module Helpers

    #
    # <tt>Essentia::Helpers::Spectral</tt>
    #
    # a set of spectral helpers to be used in streaming mode
    # for spectral representation.
    #
    # These include:
    #
    # * 'FrameCutter'
    # * 'Windowing'
    # * 'Spectrum'
    # * 'SpectralPeaks'
    #
    module Spectral

      module FrameCutter

        DEFAULT_FRAMECUTTER_OPTIONS =
        {
          'frameSize' => 4096,
          'hopSize'   => 1024,
        }

        def create(om, options = {})
          tag = FrameCutter.algorithm_name
          om.handle(tag, DEFAULT_FRAMECUTTER_OPTIONS, options)
          Essentia::Helpers::CommonCreator.create(tag, om)
        end

      end

      module Windowing

        DEFAULT_WINDOWING_OPTIONS =
        {
          'type' => 'hamming',
        }

        def create(om, options = {})
          tag = Windowing.algorithm_name
          om.handle(tag, DEFAULT_WINDOWING_OPTIONS, options)
          Essentia::Helpers::CommonCreator.create(tag, om)
        end

      end

      module Spectrum

        DEFAULT_SPECTRUM_OPTIONS =
        {
          'size' => 2048,
        }

        def create(om, options = {})
          tag = Spectrum.algorithm_name
          om.handle(tag, DEFAULT_SPECTRUM_OPTIONS, options)
          Essentia::Helpers::CommonCreator.create(tag, om)
        end

      end

      module SpectralPeaks

        DEFAULT_SPECTRAL_PEAKS_OPTIONS =
        {
          'magnitudeThreshold' => 0,
          'maxFrequency'       => 5000,
          'maxPeaks'           => 100,
          'minFrequency'       => 0,
          'orderBy'            => 'frequency',
          'sampleRate'         => 44100,
        }

        def create(om, options = {})
          tag = SpectralPeaks.algorithm_name
          om.handle(tag, DEFAULT_SPECTRAL_PEAKS_OPTIONS, options)
          Essentia::Helpers::CommonCreator.create(tag, om)
        end

      end

    end
  end
end
