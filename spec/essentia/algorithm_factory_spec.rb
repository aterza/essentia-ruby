require 'spec_helper'

describe EssentiaRuby::AlgorithmFactory do

  before :example do
    @af = EssentiaRuby::AlgorithmFactory.instance
  end

  it 'responds to the create method' do
    expect(@af.respond_to?(:create)).to be(true)
  end

end

