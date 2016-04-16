require 'spec_helper'

describe EssentiaRuby::MonoLoader do

  before :example do
    af = EssentiaRuby::AlgorithmFactory.instance
    @ml = EssentiaRuby::MonoLoader.new
    @audio_dir = File.join(AUDIO_DIR, 'generated', 'synthesized', 'impulse')
    @wav_dir = File.join(@audio_dir, 'wav')
    @ogg_dir = File.join(@audio_dir, 'ogg')
    @mp3_dir = File.join(@audio_dir, 'mp3')
    @resample_dir = File.join(@audio_dir, 'resample')
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
  end

private

  def load(filename, downmix, samplerate)
    return EssentiaRuby::MonoLoader.new(filename, downmix, samplerate)
  end

end
