require 'spec_helper'

describe EssentiaRuby::Dissonance do

  it 'responds to the compute method' do
    expect((d = EssentiaRuby::Dissonance.new).kind_of?(EssentiaRuby::Algorithm)).to be(true)
    expect(d.respond_to?(:compute)).to be(true)
  end

end
