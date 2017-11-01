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

  methods = [:keys, :[], :insert, :size, :count]

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
    expect(dm.size).to eq(0)
    dm.insert(@tk, @tv)
    expect(dm.keys().include?(@tk)).to be true
    expect(dm.size).to eq(1)
  end

  it 'has a method count() that actually works' do
    expect((dm = Essentia::DescriptionMap.new)).not_to be nil
    expect(dm.count(@tk)).to eq(0)
    dm.insert(@tk, @tv)
    expect(dm.keys().include?(@tk)).to be true
    expect(dm.count(@tk)).to eq(1)
  end

end
