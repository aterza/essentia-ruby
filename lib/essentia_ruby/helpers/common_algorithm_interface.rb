module EssentiaRuby
  module Helpers

    module CommonAlgorithmInterface
      #
      # <tt>common_algorithm_interface(audio_filename, options = {})</tt>
      #
      # Since most +Essentia+ streaming algorithms use vectors coming
      # from its FrameCutter + STFT + peak extraction algorithms as input,
      # it makes sense to use ruby's powerful +block+ mechanism to DRY up
      # the helpers code.
      #
      # Arguments
      # - +audio_filename+: the name of the audio file to be analyzed
      # - a hash of options with the following first level fields (all optional):
      #   - FrameCutter => { options: 'frameSize' and 'hopSize' }
      #   - Windowing   => { options: 'type' }
      #   - SpectralPeaks => { options: 'magnitudeThreshold' }
      #
      include EssentiaRuby::Helpers::MonoLoader
      #
      DEFAULT_ANALYSIS_OPTIONS =
      {
        'FrameCutter' => { 'frameSize' => 4096, 'hopSize' => 1024 },
        'Windowing'   => { 'type' => 'hamming' },
        'SpectralPeaks' => { 'magnitudeThreshold' => 0.05 },
      }
      def common_algorithm_interface(audio_filename, options = {})
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
        fc = EssentiaRuby::Helpers::CommonCreator.create('FrameCutter', options['FrameCutter'] || {}, DEFAULT_ANALYSIS_OPTIONS['FrameCutter'])
        w  = EssentiaRuby::Helpers::CommonCreator.create('Windowing', options['Windowing'] || {}, DEFAULT_ANALYSIS_OPTIONS['Windowing'])
        spec   = EssentiaRuby::Helpers::CommonCreator.create('Spectrum')
        peaks  = EssentiaRuby::Helpers::CommonCreator.create('SpectralPeaks', options['SpectralPeaks'] || {}, DEFAULT_ANALYSIS_OPTIONS['SpectralPeaks'])
        #
        # connect modules together
        #
        frame          = EssentiaRuby::RealVector.new
        windowed_frame = EssentiaRuby::RealVector.new
        spectrum       = EssentiaRuby::RealVector.new
        mags           = EssentiaRuby::RealVector.new
        freqs          = EssentiaRuby::RealVector.new
        final_out      = EssentiaRuby::RealNumber.new
        algo_buffer    = []
  
        fc.input('signal').set_real_vector(audio_buffer)           # audio -> frame_cutter
        fc.output('frame').set_real_vector(frame)
  
        w.input('frame').set_real_vector(frame)                    # frame_cutter -> windowed_frame
        w.output('frame').set_real_vector(windowed_frame)
  
        spec.input('frame').set_real_vector(windowed_frame)       # windowed_frame -> spectrum
        spec.output('spectrum').set_real_vector(spectrum)
  
        peaks.input('spectrum').set_real_vector(spectrum)          # spectrum -> spectral peaks detector
        peaks.output('frequencies').set_real_vector(freqs)
        peaks.output('magnitudes').set_real_vector(mags)
  
        algo = yield(freqs, mags, final_out)
  
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
          algo.compute
          algo_buffer << final_out.get
        end
  
        #
        # returns the output
        #
        algo_buffer
      end
    end

  end
end
