require 'spec_helper'

describe EssentiaRuby::MonoLoader do

  before :example do
    af = EssentiaRuby::AlgorithmFactory.instance
    @ml = EssentiaRuby::MonoLoader.new
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

end
