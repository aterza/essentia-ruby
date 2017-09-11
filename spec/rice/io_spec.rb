require 'spec_helper'

describe Essentia::Standard::RealVectorInput do

  before :example do
    @rvi = Essentia::Standard::RealVectorInput.new
  end

  it 'can be created' do
    expect(@rvi).not_to be nil
  end

  methods = [:full_name, :get]

  methods.each do
    |m|
    it "does have a #{m.to_s} method" do
      expect(@rvi.respond_to?(m)).to be true
    end
  end

  it 'has a method full_name() that actually works' do
    expect(@rvi.full_name()).to eq("whatever")
  end

  it 'has a method get() that actually works' do
    expect(@rvi.get()).to eq(23)
  end

end
