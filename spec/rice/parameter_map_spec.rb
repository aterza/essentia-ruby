require 'spec_helper'

describe Essentia::ParameterMap do

  before :example do
    @tk = 'test key'
    @tv =
    {
      @tk => Essentia::StringParameter.new('test value'),
      'real' => Essentia::RealParameter.new(23.23),
      'stereo sample' => Essentia::VectorStereoSampleParameter.new([[-1.0, 1.0], [1.0, -1.0]]),
      'int' => Essentia::IntParameter.new(42),
      'boolean' => Essentia::BoolParameter.new(true),
    }
    @pm = Essentia::ParameterMap.new
    @tv.each { |k, v| @pm.add(k, v) }
  end

  it 'can be created' do
    expect(@pm).not_to be nil
  end

  methods = [:add, :[]]

  methods.each do
    |m|
    it "does have a #{m.to_s} method" do
      expect(@pm.respond_to?(m)).to be true
    end
  end

  it 'has a method add() that actually works' do
    expect((pm = Essentia::ParameterMap.new)).not_to be nil
    @tv.each { |k, v| pm.add(k, v) }
    expect(pm.size).to eq(@tv.keys.size)
  end

  it 'has a method []() that actually works' do
    expect((pm = Essentia::ParameterMap.new)).not_to be nil
    @tv.each { |k, v| pm.add(k, v) }
    @tv.each do
      |k, v|
      p = pm[k]
      expect(p.class).to eq(@tv[k].class)
      expect(p).to eq (v)
    end
  end

  it 'can be created with a Hash' do
  end

end
