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
    @parameter_name = "test"
    @p = Essentia::StringParameter.new(@parameter_name)
  end

  it 'has all the methods in place (String)' do
    check_methods(@p)
  end

end

describe Essentia::RealParameter do

  before :example do
    @parameter_name = 23.23
    @p = Essentia::RealParameter.new(@parameter_name)
  end

  it 'has all the methods in place (Real)' do
    check_methods(@p)
  end

end

describe Essentia::BoolParameter do

  before :example do
    @parameter_name = true
    @p = Essentia::BoolParameter.new(@parameter_name)
  end

  it 'has all the methods in place (Bool)' do
    check_methods(@p)
  end

end

describe Essentia::IntParameter do

  before :example do
    @parameter_name = 23.to_i
    @p = Essentia::IntParameter.new(@parameter_name)
  end

  it 'has all the methods in place (Int)' do
    check_methods(@p)
  end

end

describe Essentia::DoubleParameter do

  before :example do
    @parameter_name = Math::PI
    @p = Essentia::DoubleParameter.new(@parameter_name)
  end

  it 'has all the methods in place (Double)' do
    check_methods(@p)
  end

end
