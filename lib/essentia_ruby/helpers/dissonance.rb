module EssentiaRuby
  module Helpers

    module Dissonance
      #
      # <tt>dissonance(audio_filename, options = {})</tt>
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
      #
      # Output
      # - an vector of dissonance values (real valued, one per frame)
      #
      include EssentiaRuby::Helpers::MonoLoader
      #
      DEFAULT_DISSONANCE_OPTIONS =
      {
        'FrameCutter' => { 'frameSize' => 4096, 'hopSize' => 2048 },
        'Windowing'   => { 'type' => 'blackmanharris62' },
      }
      def dissonance(audio_filename, options = {})
        af = EssentiaRuby::AlgorithmFactory.instance
        #
        # audio
        #
        ml = create_mono_loader(audio_filename)
        audio_buffer = EssentiaRuby::RealVector.new
        ml.output('audio').set_real_vector(audio_buffer)
        #
        # spectral representation
        #
        fc = EssentiaRuby::Helpers::CommonCreator.create('FrameCutter', options['FrameCutter'] || {}, DEFAULT_DISSONANCE_OPTIONS['FrameCutter'])
        w  = EssentiaRuby::Helpers::CommonCreator.create('Windowing', options['Windowing'] || {}, DEFAULT_DISSONANCE_OPTIONS['Windowing'])
        spec   = EssentiaRuby::Helpers::CommonCreator.create('Spectrum')
        peaks  = EssentiaRuby::Helpers::CommonCreator.create('SpectralPeaks')
        #
        # dissonance representation
        #
        diss = EssentiaRuby::Helpers::CommonCreator.create('Dissonance')
        #
        # connect modules together
        #
        frame          = EssentiaRuby::RealVector.new
        windowed_frame = EssentiaRuby::RealVector.new
        spectrum       = EssentiaRuby::RealVector.new
        mags           = EssentiaRuby::RealVector.new
        freqs          = EssentiaRuby::RealVector.new
        dissonance_out = EssentiaRuby::RealNumber.new
        dissonance_buffer = []
  
        fc.input('signal').set_real_vector(audio_buffer)           # audio -> frame_cutter
        fc.output('frame').set_real_vector(frame)
  
        w.input('frame').set_real_vector(frame)                    # frame_cutter -> windowed_frame
        w.output('frame').set_real_vector(windowed_frame)
  
        spec.input('frame').set_real_vector(windowed_frame)       # windowed_frame -> spectrum
        spec.output('spectrum').set_real_vector(spectrum)
  
        peaks.input('spectrum').set_real_vector(spectrum)          # spectrum -> spectral peaks detector
        peaks.output('frequencies').set_real_vector(freqs)
        peaks.output('magnitudes').set_real_vector(mags)
  
        diss.input('frequencies').set_real_vector(freqs)           # spectral peaks detector -> dissonance
        diss.input('magnitudes').set_real_vector(mags)
        diss.output('dissonance').set_real_output(dissonance_out)
  
        ml.compute
  
        while(true)
          fc.compute
  
          break if frame.empty?
  
          next if real_vector_is_silent(frame);
  
          #
          # run all the computations required
          #
          w.compute
          spec.compute
          peaks.compute
          diss.compute
          dissonance_buffer << dissonance_out.get
        end
  
        #
        # returns the output
        #
        dissonance_buffer
      end
    end

  end
end
