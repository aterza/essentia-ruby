module EssentiaRuby
  module Helpers

    #
    # <tt>EssentiaRuby::Helpers::Spectral</tt>
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

        def create_framecutter(om, options = {})
          tag = FrameCutter.algorithm_name
          om.handle(tag, DEFAULT_FRAMECUTTER_OPTIONS, options)
          EssentiaRuby::Helpers::CommonCreator.create(tag, om)
        end

      end

      module Windowing

        DEFAULT_WINDOWING_OPTIONS =
        {
          'type' => 'hamming',
        }

        def create_windowing(om, options = {})
          tag = Windowing.algorithm_name
          om.handle(tag, DEFAULT_WINDOWING_OPTIONS, options)
          EssentiaRuby::Helpers::CommonCreator.create(tag, om)
        end

      end

      module Spectrum

        DEFAULT_SPECTRUM_OPTIONS =
        {
          'size' => 2048,
        }

        def create_spectrum(om, options = {})
          tag = Spectrum.algorithm_name
          om.handle(tag, DEFAULT_SPECTRUM_OPTIONS, options)
          EssentiaRuby::Helpers::CommonCreator.create(tag, om)
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

        def create_spectral_peaks(om, options = {})
          tag = SpectralPeaks.algorithm_name
          om.handle(tag, DEFAULT_SPECTRAL_PEAKS_OPTIONS, options)
          EssentiaRuby::Helpers::CommonCreator.create(tag, om)
        end

      end

    end
  end
end
