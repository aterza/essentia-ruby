require 'spec_helper'

describe EssentiaRuby::Dissonance do

  before :example do
    @d = EssentiaRuby::Dissonance.new
  end

  it 'is a child class of the EssentiaRuby::Algorithm class' do
    expect(@d.kind_of?(EssentiaRuby::Algorithm)).to be(true)
  end

  it 'responds to the compute method' do
    expect(@d.respond_to?(:compute)).to be(true)
  end

  it 'has a helper method' do
    include EssentiaRuby::Helpers

    expect(defined?(:dissonance)).to eq('expression')
  end

  it 'has a low_level helper method' do
    include EssentiaRuby::Helpers

    expect(defined?(:compute_dissonance)).to eq('expression')
  end
  #
  # The next specs intend to replicate literally (as much as possible) the
  # tests provided with the python bindings native in Essentia
  #
  it 'should have no dissonance when passed silent (empty) frames' do
  end

end
