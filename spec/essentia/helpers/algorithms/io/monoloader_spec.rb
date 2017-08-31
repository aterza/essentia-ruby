require 'spec_helper'

describe Essentia::Helpers::MonoLoader do

  before :example do
    @audio_dir = File.join(AUDIO_DIR, 'generated', 'synthesised', 'impulse')
    @formats = [ 'wav', 'ogg', 'mp3' ]
    @params = { basename: 'impulses_1second_44100_st', dur: 10.0, sample_rate: 44100 }
  end

  it 'has a helper that creates the mono_loader' do
    filename = File.join(@audio_dir, 'wav', "impulses_1second_44100.wav")
    om = Essentia::Models::OptionManager.new
    expect((ml = Essentia::Helpers::MonoLoader.create(filename, om))).not_to be nil
    expect(Essentia.connect_to_devnull(ml.output('audio'), Essentia::NOWHERE)).to be nil
    expect(ml.is_a?(Essentia::StreamingAlgorithm)).to be true
  end

  it 'will read any kind of audio file format' do
    om = Essentia::Models::OptionManager.new
    @formats.each do
      |f|
      dir = File.join(@audio_dir, f)
      audio_files = Dir.glob(File.join(dir, '*'))
      expect(audio_files.empty?).to be false
      audio_files.each do
        |af|
        expect((s = Essentia::RealVectorSink.new)).not_to be nil
        expect(File.exists?(af)).to be true
        expect((ml = Essentia::Helpers::MonoLoader.create(af, om))).not_to be nil
byebug
        expect(Essentia.connect(ml.output('audio'), s)).to be nil
        expect((n = Essentia::Scheduler::Network.new(ml))).not_to be nil
        n.run
      end
    end
  end

# it 'responds to the compute method' do
#   expect(@ml.respond_to?(:compute)).to be(true)
# end

# it 'has a helper that returns an audio buffer filled up with samples' do
#   @formats.each do
#     |f|
#     dir = File.join(@audio_dir, f)
#     filename = File.join(dir, "impulses_1second_44100_st.#{f}")
#     expect(File.exists?(filename)).to be(true), filename
#     dur = @params[:dur]
#     sample_rate = @params[:sample_rate]
#     n_samples = dur * sample_rate
#     expect((out = mono_loader(filename)).class).to be(Essentia::RealVector)
#     expect(out.size.to_i).to be >= n_samples.to_i, "file: #{File.basename(filename)}, num samples #{out.size.to_i}"
#     sample = sample_rate
#     #
#     # This file has one single ca.1 sample every second, all other samples are
#     # zero. So we check the one sample every second.
#     #
#     while(sample < n_samples)
#       expect(out[sample]).to be_within(0.05).of(1.0), "format: #{f}, sample num: #{sample}, value: #{out[sample]}"
#       sample += sample_rate
#     end
#   end
# end

  #
  # The next specs intend to replicate literally (as much as possible) the
  # tests provided with the python bindings native in Essentia
  #
end
