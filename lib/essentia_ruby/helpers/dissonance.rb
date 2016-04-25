module EssentiaRuby
  module Helpers

    #
    # <tt>dissonance(audio_filename)</tt>
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
    #
    # Output
    # - an +EssentiaRuby::RealArray+ vector of dissonance values
    #
    def dissonance(audio_filename)
      #
      # audio
      #
      ml = create_mono_loader(audio_filename)
      audio_buffer = EssentiaRuby::RealVector.new
      ml.output('audio').set_real_vector(audio_buffer)
      #
      # spectral representation
      #
      int frame_size = 4096
      int hop_size   = (frame_size / 4.0).to_i
      fc = EssentiaRuby::AlgorithmFactory.create('FrameCreator', 'frameSize', frame_size, 'hopSize', hop_size)
      w = EssentiaRuby::AlgorithmFactory.create('Windowing', 'type', 'blackmanharris62')
      spec = EssentiaRuby::AlgorithmFactory.create('Spectrum')
      #
      # dissonance representation
      #
      diss = EssentiaRuby::AlgorithmFactory.create('Dissonance')
      #
      # connect modules together
      #
      fc.input('signal').set_real_vector(audio_buffer)
      frame = EssentiaRuby.
      #
      # connect
      mags = nil; freqs = nil;
      compute_dissonance(mags, freqs)
    end

    #
    # <tt>compute_dissonance(mags, fregs)</tt>
    #
    # This is the method that does the actual low-level computation of the
    # dissonance, given a vector of magnitudes and a vector of frequencies.
    # Exceptions are thrown when the size of the input vectors are not
    # of the same size or if input frequencies are not ordered ascendantly.
    #
    def compute_dissonance(mags, freqs)
      #
      # TODO:
      # - set the inputs
      # - instantiate the C++ class
      # - call the compute() method
      # - read the output
      #
      []
    end

  end
end
