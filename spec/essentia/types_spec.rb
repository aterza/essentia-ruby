require 'spec_helper'

class ATestObject; end

describe EssentiaRuby::AnyVector do

  before :example do
    @mixed_bag = [23, 16.0, 'whatever', ATestObject.new]
  end

  it 'can be created with different arguments' do
    expect((av = EssentiaRuby::AnyVector.new).class).to be(EssentiaRuby::AnyVector)
    expect((av = EssentiaRuby::AnyVector.new(23)).class).to be(EssentiaRuby::AnyVector)
    expect((av = EssentiaRuby::AnyVector.new(@mixed_bag)).class).to be(EssentiaRuby::AnyVector)
  end

  it 'behaves like a regular ruby array' do
    expect((av = EssentiaRuby::AnyVector.new(@mixed_bag)).class).to be(EssentiaRuby::AnyVector)
    expect(av[-1]).to eq(@mixed_bag[-1]), -1.to_s
    av.each_with_index { |v, idx| expect(v).to eq(@mixed_bag[idx]), idx.to_s }
    [:each, :map, :size, :count].each { |method| expect(av.respond_to?(method)).to be(true) }
  end

  it 'handles exceptional conditions gracefully' do
    expect((av = EssentiaRuby::AnyVector.new(@mixed_bag)).class).to be(EssentiaRuby::AnyVector)
    expect(av[av.size + 3]).to be_nil
  end

end

describe EssentiaRuby::RealVector do

  before :example do
    @real_bag = [23, 16.0, -36e-5, 23.23e18, 2323]
  end

  it 'can be created with different arguments' do
    expect((rv = EssentiaRuby::RealVector.new).class).to be(EssentiaRuby::RealVector)
    expect((rv = EssentiaRuby::RealVector.new(23)).class).to be(EssentiaRuby::RealVector)
    expect((rv = EssentiaRuby::RealVector.new(@real_bag)).class).to be(EssentiaRuby::RealVector)
  end

  it 'behaves like a regular ruby array' do
    expect((rv = EssentiaRuby::RealVector.new(@real_bag)).class).to be(EssentiaRuby::RealVector)
    expect(rv[-1]).to be_within(1e-15).of(@real_bag[-1]), -1.to_s
    rv.each_with_index { |v, idx| expect(v).to be_within((v*1e-6).abs).of(@real_bag[idx]), idx.to_s }
    [:each, :map, :size, :count].each { |method| expect(rv.respond_to?(method)).to be(true) }
  end

  it 'handles exceptional conditions gracefully' do
    expect((rv = EssentiaRuby::RealVector.new(@real_bag)).class).to be(EssentiaRuby::RealVector)
    expect(rv[rv.size + 3]).to be_nil
    expect { rv << 'what can happen with a string?' }.to raise_error(TypeError)
  end

end

describe EssentiaRuby::StringVector do

  before :example do
    @string_bag = [ 'blurp', 23.to_s, (16.0).to_s, (-36e-5).to_s, (23.23e18).to_s, 2323.to_s ]
  end

  it 'can be created with different arguments' do
    expect((rv = EssentiaRuby::StringVector.new).class).to be(EssentiaRuby::StringVector)
    expect((rv = EssentiaRuby::StringVector.new([ 23.to_s ])).class).to be(EssentiaRuby::StringVector)
    expect((rv = EssentiaRuby::StringVector.new(@string_bag)).class).to be(EssentiaRuby::StringVector)
  end

  it 'behaves like a regular ruby array' do
    expect((rv = EssentiaRuby::StringVector.new(@string_bag)).class).to be(EssentiaRuby::StringVector)
    expect(rv[-1]).to eq(@string_bag[-1]), -1.to_s
    rv.each_with_index { |v, idx| expect(v).to eq(@string_bag[idx]), idx.to_s }
    [:each, :map, :size, :count].each { |method| expect(rv.respond_to?(method)).to be(true) }
  end

  it 'handles exceptional conditions gracefully' do
    expect((rv = EssentiaRuby::StringVector.new(@string_bag)).class).to be(EssentiaRuby::StringVector)
    expect(rv[rv.size + 3]).to be_nil
    value = 23.23
    expect { rv << value }.to raise_error(TypeError), "Real #{value} did not raise a TypeError as expected"
  end

end
