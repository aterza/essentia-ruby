require 'spec_helper'

describe 'Essentia::real_vector_is_silent' do

  include Essentia

  before :example do
    loader = [0.0] * 16
    @empty_array = Essentia::RealVector.new(loader)
    loader = [[0.0] * 7, 1, [0.0] * 8].flatten
    @full_array  = Essentia::RealVector.new(loader)
  end

  it 'returns true when no sound samples are present' do
    expect(real_vector_is_silent(@empty_array)).to be(true)
  end

  it 'returns false when no sound samples are present' do
    expect(real_vector_is_silent(@full_array)).to be(false)
  end

end
