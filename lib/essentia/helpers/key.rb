module Essentia
  module Helpers

    module Key
      #
      # <tt>key(audio_filename, options = {})</tt>
      #
      #
      # Arguments
      # - +audio_filename+: the name of the audio file to be analyzed
      # - a hash of options with the following first level fields (all optional):
      #   - FrameCutter => { options: 'frameSize' and 'hopSize' }
      #   - Windowing   => { options: 'type' }
      #   - SpectralPeaks => { options: 'magnitudeThreshold' }
      #
      # Output
      # - an vector of key values (real valued, one per frame)
      #
      include Essentia::Helpers::CommonAlgorithmInterface
      #

      def key(audio_filename, options = {})

        diss = Essentia::Helpers::CommonCreator.create('Dissonance')

        res = common_algorithm_interface(audio_filename, options) do
          |freqs, mags, output|
  
          diss.input('frequencies').set_real_vector(freqs)           # spectral peaks detector -> key
          diss.input('magnitudes').set_real_vector(mags)
          diss.output('key').set_real_output(output)

          diss
        end
  
        #
        # returns the output
        #
        res
      end
    end

  end
end
