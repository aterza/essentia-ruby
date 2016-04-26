require 'spec_helper'

describe EssentiaRuby::Dissonance do

  include EssentiaRuby::Helpers::Dissonance

  before :example do
    @d = EssentiaRuby::Dissonance.new
    @audio_file = File.join(AUDIO_FIXTURES_DIR, 'dissonance_sqw_44100_mono.wav')
  end

  it 'is a child class of the EssentiaRuby::Algorithm class' do
    expect(@d.kind_of?(EssentiaRuby::Algorithm)).to be(true)
  end

  it 'responds to the compute method' do
    expect(@d.respond_to?(:compute)).to be(true)
  end

  it 'has a helper method' do
    expect(defined?(:dissonance)).to eq('expression')
  end

  it 'actually computes the dissonance' do
    expect((d = dissonance(@audio_file)).class).to be(EssentiaRuby::RealVector)
    expect(d.empty?).to be(false)
  end
  #
  # The next specs intend to replicate literally (as much as possible) the
  # tests provided with the python bindings native in Essentia
  #

end
