require 'spec_helper'

describe EssentiaRuby::MonoLoader do

  include EssentiaRuby::Helpers::MonoLoader

  before :example do
    @audio_dir = File.join(AUDIO_DIR, 'generated', 'synthesised', 'impulse')
    @formats = [ 'wav', 'ogg', 'mp3' ]
    @ml = EssentiaRuby::AlgorithmFactory.instance.create('MonoLoader')
    @params = { basename: 'impulses_1second_44100_st', dur: 10.0, sample_rate: 44100 }
  end

  it 'is a child class of the EssentiaRuby::Algorithm class' do
    expect(@ml.kind_of?(EssentiaRuby::Algorithm)).to be(true)
  end

  it 'responds to the compute method' do
    expect(@ml.respond_to?(:compute)).to be(true)
  end

  it 'has a helper that returns an audio buffer filled up with samples' do
    @formats.each do
      |f|
      dir = File.join(@audio_dir, f)
      filename = File.join(dir, "impulses_1second_44100_st.#{f}")
      expect(File.exists?(filename)).to be(true), filename
      dur = @params[:dur]
      sample_rate = @params[:sample_rate]
      n_samples = dur * sample_rate
      expect((out = mono_loader(filename)).class).to be(EssentiaRuby::RealVector)
      expect(out.size.to_i).to be >= n_samples.to_i, "file: #{File.basename(filename)}, num samples #{out.size.to_i}"
      sample = sample_rate
      #
      # This file has one single ca.1 sample every second, all other samples are
      # zero. So we check the one sample every second.
      #
      while(sample < n_samples)
        expect(out[sample]).to be_within(0.05).of(1.0), "format: #{f}, sample num: #{sample}, value: #{out[sample]}"
        sample += sample_rate
      end
    end
  end

  #
  # The next specs intend to replicate literally (as much as possible) the
  # tests provided with the python bindings native in Essentia
  #
end
