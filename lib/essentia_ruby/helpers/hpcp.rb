module EssentiaRuby
  module Helpers

    module HPCP
      #
      # <tt>hpcp(audio_filename, options = {})</tt>
      #
      # Computes a Harmonic Pitch Class Profile (HPCP) from the spectral
      # peaks of a signal. HPCP is a k*12 dimensional vector which
      # represents the intensities of the twelve (k==1) semitone pitch
      # classes (corresponsing to notes from A to G#), or subdivisions
      # of these (k>1).
      #
      # Exceptions are thrown if "minFrequency", "bandSplitFrequency"
      # and "maxFrequency" are not separated by at least 200Hz from each
      # other, requiring that "maxFrequency" be greater than
      # "bandSplitFrequency" and "bandSplitFrequency" be greater than
      # "minFrequency". Other exceptions are thrown if input vectors
      # have different size, if parameter "size" is not a positive
      # non-zero multiple of 12 or if "windowSize" is less than one hpcp
      # bin (12/size).
      #
      # References:
      # [1] T. Fujishima, "Realtime Chord Recognition of Musical Sound:
      # A System Using Common Lisp Music," in International Computer
      # Music Conference (ICMC'99), pp. 464-467, 1999.
      #
      # [2] E. Gómez, "Tonal Description of Polyphonic Audio for Music
      # Content Processing," INFORMS Journal on Computing, vol. 18, no.
      # 3, pp. 294–304, 2006.
      #
      # [3] Harmonic pitch class profiles - Wikipedia, the free
      # encyclopedia,
      # https://en.wikipedia.org/wiki/Harmonic_pitch_class_profiles
      #
      #
      # Arguments
      # - +audio_filename+: the name of the audio file to be analyzed
      # - a hash of options with the following first level fields (all optional):
      #   - FrameCutter => { options: 'frameSize' and 'hopSize' }
      #   - Windowing   => { options: 'type' }
      #   - SpectralPeaks => { options: 'magnitudeThreshold' }
      #   - HPCP        => { options: 'minFrequency', 'maxFrequency',
      #                               'referenceFrequency', 'harmonics' }
      #
      #
      # Output
      # - an vector of hpcp values (real valued, one per frame)
      #
      #
      include EssentiaRuby::Helpers::CommonAlgorithmInterface
      #
      DEFAULT_HPCP_OPTIONS = 
      {
              minFrequency: 40,
              maxFrequency: 5000,
              referenceFrequency: 440,
              harmonics:    0,    # use the fundamental only
      }

      def hpcp(audio_filename, options = {})

        hpcp = EssentiaRuby::Helpers::CommonCreator.create('HPCP', manage_options('HPCP', options, DEFAULT_HPCP_OPTIONS))

        res = common_algorithm_interface(audio_filename, options) do
          |freqs, mags, output|
  
          hpcp.input('frequencies').set_real_vector(freqs)           # spectral peaks detector -> hpcp
          hpcp.input('magnitudes').set_real_vector(mags)
          hpcp.output('hpcp').set_real_vector(output)

          hpcp
        end
  
        #
        # returns the output
        #
        res
      end
    end

  end
end

