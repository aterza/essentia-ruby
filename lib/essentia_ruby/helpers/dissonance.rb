module EssentiaRuby
  module Helpers

    module Dissonance

      DEFAULT_DISSONANCE_OPTIONS = {} # there are no options for +dissonance+

      #
      # <tt>create_dissonance(om, options = {})</tt>
      #
      # return a configured MonoLoader algorithm suitable to be used in
      # streaming configurations.
      #
      # This algorithm takes no options.
      #
      def create_dissonance(om, options = {})
        tag = Dissonance.algorithm_name
        om = EssentiaRuby::Helpers::Option.handle(tag, DEFAULT_DISSONANCE_OPTIONS, options)
        EssentiaRuby::Helpers::CommonCreator.create(ALGORITHM_NAME, om)
      end

      #
      # <tt>dissonance(audio_filename, options = {})</tt>
      #
      # stand-alone version of the +dissonance+ algorithm. For a streaming
      # version, use the +create_dissonance+ function.
      #
      # This algorithm calculates the sensory dissonance (to distinguish
      # from musical or theoretical  dissonance)  of  an  audio  signal.
      # Sensory dissonance measures perceptual roughness  of  the  sound
      # and is based on the roughness of its spectral peaks.  Given  the
      # spectral peaks, the  algorithm  estimates  total  dissonance  by
      # summing up the normalized dissonance values  for  each  pair  of
      # peaks. These values are computed using dissonance curves,  which
      # define dissonace between two spectral peaks according  to  their
      # frequency and amplitude relations.  The  dissonance  curves  are
      # based on perceptual experiments conducted in [1]. Exceptions are
      # thrown when the size of the input vectors are not  equal  or  if
      # input frequencies are not ordered ascendantly
      # 
      # References:
      #   [1] R. Plomp and W. J. M. Levelt, "Tonal Consonance and Critical Bandwidth," The Journal of the Acoustical Society of America, vol. 38, no. 4, pp. 548–560, 1965.
      #   [2] Critical Band - Handbook for Acoustic Ecology http://www.sfu.ca/sonic-studio/handbook/Critical_Band.html
      #   [3] Bark Scale - Wikipedia, the free encyclopedia, http://en.wikipedia.org/wiki/Bark_scale
      #
      # Arguments
      # - +audio_filename+: the name of the audio file to be analyzed
      # - a hash of options with the following first level fields (all optional):
      #   - FrameCutter => { options: 'frameSize' and 'hopSize' }
      #   - Windowing   => { options: 'type' }
      #   - SpectralPeaks => { options: 'magnitudeThreshold' }
      #
      # Output
      # - an vector of dissonance values (real valued, one per frame)
      #
      include EssentiaRuby::Helpers::CommonAlgorithmInterface
      #

      def dissonance(audio_filename, options = {})

        res = common_algorithm_interface(audio_filename, options) do
          |freqs, mags, output|

          diss = create_dissonance(options)
  
          diss.input('frequencies').set_real_vector(freqs)           # spectral peaks detector -> dissonance
          diss.input('magnitudes').set_real_vector(mags)
          diss.output('dissonance').set_real_output(output)

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
