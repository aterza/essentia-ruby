require 'spec_helper'

describe EssentiaRuby::MonoLoader do

  include EssentiaRuby::Helpers::MonoLoader

  before :example do
    @audio_dir = File.join(AUDIO_DIR, 'generated', 'synthesised', 'impulse')
    @wav_dir = File.join(@audio_dir, 'wav')
    @ogg_dir = File.join(@audio_dir, 'ogg')
    @mp3_dir = File.join(@audio_dir, 'mp3')
    @resample_dir = File.join(@audio_dir, 'resample')
    @ml = EssentiaRuby::AlgorithmFactory.instance.create('MonoLoader')
  end

  it 'is a child class of the EssentiaRuby::Algorithm class' do
    expect(@ml.kind_of?(EssentiaRuby::Algorithm)).to be(true)
  end

  it 'responds to the compute method' do
    expect(@ml.respond_to?(:compute)).to be(true)
  end

  #
  # The next specs intend to replicate literally (as much as possible) the
  # tests provided with the python bindings native in Essentia
  #
  it 'barfs on invalid parameters' do
    filename = File.join(@wav_dir, 'impulses_1second_44100_st.wav')
    expect(File.exists?(filename)).to be(true), filename
    expect((ml = mono_loader(filename)).class).to be(EssentiaRuby::Algorithm)
    skip('TODO: Still to be completed')
  end

end
