require 'spec_helper'

describe Essentia::DescriptionMap do

  before :example do
    @tk = 'test key'
    @tv = 'test value'
    @dm = Essentia::DescriptionMap.new
  end

  it 'can be created' do
    expect(@dm).not_to be nil
  end

  methods = [:keys, :[], :insert]

  methods.each do
    |m|
    it "does have a #{m.to_s} method" do
      expect(@dm.respond_to?(m)).to be true
    end
  end

  it 'has a method keys() that actually works' do
    expect((dm = Essentia::DescriptionMap.new)).not_to be nil
    dm.insert(@tk, @tv)
    expect(dm.keys().first).to eq(@tk)
  end

  it 'has a method []() that actually works' do
    expect((dm = Essentia::DescriptionMap.new)).not_to be nil
    dm.insert(@tk, @tv)
    expect(dm[@tk]).to eq (@tv)
  end

  it 'has a method insert() that actually works' do
    expect((dm = Essentia::DescriptionMap.new)).not_to be nil
    dm.insert(@tk, @tv)
    expect(dm.keys().include?(@tk)).to be true
  end

end
