require 'spec_helper'

describe EssentiaRuby::AlgorithmFactory do

  before :example do
    @af = EssentiaRuby::AlgorithmFactory.instance
  end

  it 'responds to the create method' do
    expect(@af.respond_to?(:create)).to be(true)
  end

  it 'raises the proper exceptions with informative messages if needed' do
    p = EssentiaRuby::Parameter.new('blargh')
    key = 'zorgh'
    msg = "Essentia error: Trying to configure algorithm 'MonoLoader' with parameter '#{key}' but it only accepts the following ones: [downmix, filename, sampleRate]"
    expect { @af.create('MonoLoader', key, p) }.to raise_error { |error| expect(error.message).to match(/\AEssentia error: Trying to configure algorithm/) }
  end

end
