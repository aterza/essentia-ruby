require 'spec_helper'

describe Essentia::Helpers::Dissonance do

  include Essentia::Helpers::Dissonance

  before :example do
    @d = Essentia::Helpers::Dissonance.new
    @audio_file = File.join(AUDIO_FIXTURES_DIR, 'dissonance_sqw_44100_mono.wav')
  end

  it 'is a child class of the Essentia::Algorithm class' do
    expect(@d.kind_of?(Essentia::Algorithm)).to be(true)
  end

  it 'responds to the compute method' do
    expect(@d.respond_to?(:compute)).to be(true)
  end

  it 'has a helper method' do
    expect(defined?(:dissonance)).to eq('expression')
  end

  it 'actually computes the dissonance' do
    expect((d = dissonance(@audio_file)).class).to be(Array)
    expect(d.empty?).to be(false)
  end
  #
  # The next specs intend to replicate literally (as much as possible) the
  # tests provided with the python bindings native in Essentia
  #

end
