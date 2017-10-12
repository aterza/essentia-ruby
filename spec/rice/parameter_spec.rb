require 'spec_helper'

describe Essentia::ParamType do

  before :example do
    @constants =
      %w(
        UNDEFINED
        REAL
        STRING
        BOOL
        INT
        STEREOSAMPLE
        VECTOR_REAL
        VECTOR_STRING
        VECTOR_BOOL
        VECTOR_INT
        VECTOR_STEREOSAMPLE
        VECTOR_VECTOR_REAL
        VECTOR_VECTOR_STRING
        VECTOR_VECTOR_STEREOSAMPLE
        VECTOR_MATRIX_REAL
        MAP_VECTOR_REAL
        MAP_VECTOR_STRING
        MAP_VECTOR_INT
        MAP_REAL
        MATRIX_REAL
      )
  end

  it 'has constants that can be checked' do
    @constants.each do
      |c|
      expect(Essentia::ParamType.constants.include?(c.to_sym)).to(be(true), c)
    end
  end

end

def check_methods(obj)

  parameter_methods =
  [
    :clear, :assign, :==, :!=, :type, :is_configured?, :to_s, :downcase,
    :to_boolean, :to_double, :to_f, :to_stereo_sample, :to_i, :to_real,
    :to_vector_real, :to_vector_string, :to_vector_int, :to_vector_boolean,
    :to_vector_stereo_sample, :to_vector_vector_real, :to_vector_vector_string,
    :to_vector_vector_stereo_sample, :to_vector_matrix_real, :to_map_vector_real,
    :to_map_vector_string, :to_map_real, :to_matrix_real,
  ]

  parameter_methods.each do
    |m|
    expect(obj.respond_to?(m)).to(be(true), m.to_s)
  end

end

describe Essentia::ParameterBase do

  before :example do
    @parameter_name = Essentia::ParamType::UNDEFINED
    @p = Essentia::ParameterBase.new(@parameter_name)
  end

  it 'can be created' do
    expect(@p).not_to be nil
  end

  it 'has all the methods in place (Base)' do
    check_methods(@p)
  end

end

describe Essentia::StringParameter do

  before :example do
    @parameter_value = "TEST test"
    @p = Essentia::StringParameter.new(@parameter_value)
    @not_p = Essentia::StringParameter.new("not Test")
  end

  it 'has all the methods in place (String)' do
    check_methods(@p)
  end

  it 'actually does work' do
    expect(@p.type).to eq(Essentia::ParamType::STRING)
    expect(@p.to_s).to eq(@parameter_value)
    expect(@p.downcase).to eq(@parameter_value.downcase)
    expect(@p == @p).to be true
    expect(@p == @not_p).to be false
    expect(@p != @not_p).to be true
    expect(@p.is_configured?).to be true
  end

end

describe Essentia::RealParameter do

  before :example do
    @parameter_value = 23.23
    @p = Essentia::RealParameter.new(@parameter_value)
  end

  it 'has all the methods in place (Real)' do
    check_methods(@p)
  end

end

describe Essentia::BoolParameter do

  before :example do
    @parameter_value = true
    @p = Essentia::BoolParameter.new(@parameter_value)
  end

  it 'has all the methods in place (Bool)' do
    check_methods(@p)
  end

end

describe Essentia::IntParameter do

  before :example do
    @parameter_value = 23.to_i
    @p = Essentia::IntParameter.new(@parameter_value)
  end

  it 'has all the methods in place (Int)' do
    check_methods(@p)
  end

end

describe Essentia::DoubleParameter do

  before :example do
    @parameter_value = Math::PI
    @p = Essentia::DoubleParameter.new(@parameter_value)
  end

  it 'has all the methods in place (Double)' do
    check_methods(@p)
  end

end

describe Essentia::UintParameter do

  before :example do
    @parameter_value = 232323232323232323232323
    @p = Essentia::UintParameter.new(@parameter_value)
  end

  it 'has all the methods in place (Uint)' do
    check_methods(@p)
  end

end

describe Essentia::StereoSampleParameter do

  before :example do
    @parameter_value = [1.0, -1.0]
    @p = Essentia::StereoSampleParameter.new(@parameter_value)
  end

  it 'has all the methods in place (StereoSample)' do
    check_methods(@p)
  end

end
