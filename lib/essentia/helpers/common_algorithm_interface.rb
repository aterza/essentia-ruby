module Essentia
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
      #   - MonoLoader  => { options: 'downmix', 'sampleRate' }
      #   - FrameCutter => { options: 'frameSize' and 'hopSize' }
      #   - Windowing   => { options: 'type' }
      #   - SpectralPeaks => { options: 'magnitudeThreshold' }
      #
      include Essentia::Helpers::MonoLoader
      #
      DEFAULT_ANALYSIS_OPTIONS =
      {
        'FrameCutter' => { 'frameSize' => 4096, 'hopSize' => 1024 },
        'Windowing'   => { 'type' => 'hamming' },
        'SpectralPeaks' => { 'magnitudeThreshold' => 0.05 },
      }
      def common_algorithm_interface(audio_filename, options = {})
        om = Essentia::OptionManager.new
        om.handle(options)
        #
        # options
        #
        #
        # audio
        #
        (ml, audio_buffer) = create_mono_loader(audio_filename)
        #
        # spectral representation
        #
        fc = Essentia::Helpers::CommonCreator.create('FrameCutter', options['FrameCutter'] || {}, DEFAULT_ANALYSIS_OPTIONS['FrameCutter'])
        w  = Essentia::Helpers::CommonCreator.create('Windowing', options['Windowing'] || {}, DEFAULT_ANALYSIS_OPTIONS['Windowing'])
        spec   = Essentia::Helpers::CommonCreator.create('Spectrum')
        peaks  = Essentia::Helpers::CommonCreator.create('SpectralPeaks', options['SpectralPeaks'] || {}, DEFAULT_ANALYSIS_OPTIONS['SpectralPeaks'])
        #
        # connect modules together
        #
        frame          = Essentia::RealVector.new
        windowed_frame = Essentia::RealVector.new
        spectrum       = Essentia::RealVector.new
        mags           = Essentia::RealVector.new
        freqs          = Essentia::RealVector.new
        final_out      = Essentia::RealNumber.new
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
