require 'spec_helper'

describe Essentia::Standard::RealVectorInput do

  before :example do
    @rvi = Essentia::Standard::RealVectorInput.new
    @name = "whatever"
    @rvi.set_name(@name)
  end

  it 'can be created' do
    expect(@rvi).not_to be nil
  end

  it 'has the proper parenting scheme' do
    expect(@rvi.class.superclass).to eq(Essentia::Standard::Rice_essentia_RealVectorInput_)
    expect(@rvi.class.superclass.superclass).to eq(Essentia::Standard::InputBase)
    expect(@rvi.class.superclass.superclass.superclass).to eq(Essentia::TypeProxy)
  end

# methods = [:set_name, :name, :full_name, :set_vector, :get_vector]
  methods = [:set_name, :name, :full_name, ]

  methods.each do
    |m|
    it "does have a #{m.to_s} method" do
      expect(@rvi.respond_to?(m)).to(be(true), m.to_s)
    end
  end

  it 'has a method set_name() and a method name() that actually work' do
    another_rvi = Essentia::Standard::RealVectorInput.new
    name = "test"
    another_rvi.set_name(name)
    expect(another_rvi.name).to eq(name)
    expect(another_rvi.full_name).to eq("<NoParent>::" + name)
  end

  it 'has a method full_name() that actually works' do
    expect(@rvi.full_name()).to eq("<NoParent>::" + @name)
  end

# it 'has a method set_vector() and a method get_vector() that actually work' do
#   a = [1, 2, 3, 4]
#   another_rvi = Essentia::Standard::RealVectorInput.new
#   expect(another_rvi.set_vector(a)).to_be nil
#   expect(another_rvi.get_vector).to eq(a)
# end

end
