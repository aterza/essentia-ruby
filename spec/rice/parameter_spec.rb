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
    @not_p = Essentia::RealParameter.new(@parameter_value / 2.0)
    @wanted_precision = 20
  end

  it 'has all the methods in place (Real)' do
    check_methods(@p)
  end

  it 'actually does work' do
    expect(@p.type).to eq(Essentia::ParamType::REAL)
    expect(@p.to_real).to be_within(1.0e-5).of(@parameter_value)
    expect(@p.to_s.size).to eq(13)
    expect(@p.to_s(@wanted_precision).size).to eq(@wanted_precision+1)
    expect(@p == @p).to be true
    expect(@p == @not_p).to be false
    expect(@p != @not_p).to be true
    expect(@p.is_configured?).to be true
  end

end

describe Essentia::BoolParameter do

  before :example do
    @parameter_value = true
    @p = Essentia::BoolParameter.new(@parameter_value)
    @not_p = Essentia::BoolParameter.new(!@parameter_value)
  end

  it 'has all the methods in place (Bool)' do
    check_methods(@p)
  end

  it 'actually does work' do
    expect(@p.type).to eq(Essentia::ParamType::BOOL)
    expect(@p.to_boolean).to be true
    expect(@not_p.to_boolean).to be false
    expect(@p == @p).to be true
    expect(@p == @not_p).to be false
    expect(@p != @not_p).to be true
    expect(@p.is_configured?).to be true
  end

end

describe Essentia::IntParameter do

  before :example do
    @parameter_value = 23.to_i
    @p = Essentia::IntParameter.new(@parameter_value)
    @not_p = Essentia::IntParameter.new(@parameter_value / 2)
  end

  it 'has all the methods in place (Int)' do
    check_methods(@p)
  end

  it 'actually does work' do
    expect(@p.type).to eq(Essentia::ParamType::INT)
    expect(@p.to_i).to eq(@parameter_value)
    expect(@p.to_s).to eq(@parameter_value.to_s)
    expect(@p.to_s.size).to eq(@parameter_value.to_s.size)
    expect(@p == @p).to be true
    expect(@p == @not_p).to be false
    expect(@p != @not_p).to be true
    expect(@p.is_configured?).to be true
  end

end

describe Essentia::DoubleParameter do

  before :example do
    @parameter_value = Math::PI
    @p = Essentia::DoubleParameter.new(@parameter_value)
    @not_p = Essentia::DoubleParameter.new(Math::sqrt(@parameter_value))
    @wanted_precision = 20
  end

  it 'has all the methods in place (Double)' do
    check_methods(@p)
  end

  it 'actually does work' do
    expect(@p.type).to eq(Essentia::ParamType::REAL)
    expect(@p.to_double).to be_within(1.0e-6).of(@parameter_value)
    expect(@p.to_s(6)).to eq(@parameter_value.to_s[0..6])
    expect(@p.to_s.size).to eq(13)
    expect(@p.to_s(@wanted_precision).size).to eq(@wanted_precision+1)
    expect(@p == @p).to be true
    expect(@p == @not_p).to be false
    expect(@p != @not_p).to be true
    expect(@p.is_configured?).to be true
  end

end

describe Essentia::UintParameter do

  #
  # over 2**24 we see strange aberrations in numbers
  #
  before :example do
    @parameter_value = ((2**24)-1)
    @p = Essentia::UintParameter.new(@parameter_value)
    @not_p = Essentia::UintParameter.new(@parameter_value / 2)
  end

  it 'has all the methods in place (Uint)' do
    check_methods(@p)
  end

  it 'actually does work' do
    expect(@p.type).to eq(Essentia::ParamType::INT)
    expect(@p.to_i).to eq(@parameter_value)
    expect(@p.to_s(10)).to eq(@parameter_value.to_s[0..9])
    expect(@p.to_s.size).to eq(@parameter_value.to_s.size)
    expect(@p == @p).to be true
    expect(@p == @not_p).to be false
    expect(@p != @not_p).to be true
    expect(@p.is_configured?).to be true
  end

end

describe Essentia::StereoSampleParameter do

  before :example do
    @parameter_value = [0.999, -0.999]
    @p = Essentia::StereoSampleParameter.new(@parameter_value)
    @not_p = Essentia::StereoSampleParameter.new(@parameter_value.map { |x| x/2.0 })
  end

  it 'has all the methods in place (StereoSample)' do
    check_methods(@p)
  end

  it 'actually does work' do
    expect(@p.type).to eq(Essentia::ParamType::STEREOSAMPLE)
    a = @p.to_stereo_sample
    a.each_index { |idx| expect(a[idx]).to be_within(1e-6).of(@parameter_value[idx]) }
    expect(@p == @p).to be true
    expect(@p == @not_p).to be false
    expect(@p != @not_p).to be true
    expect(@p.is_configured?).to be true
  end

end

describe Essentia::VectorRealParameter do

  before :example do
    @parameter_value = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0]
    @p = Essentia::VectorRealParameter.new(@parameter_value)
    @not_p = Essentia::VectorRealParameter.new(@parameter_value.map { |x| x/2.0 })
  end

  it 'has all the methods in place (VectorReal)' do
    check_methods(@p)
  end

  it 'actually does work' do
    expect(@p.type).to eq(Essentia::ParamType::VECTOR_REAL)
    a = @p.to_vector_real
    a.each_index { |idx| expect(a[idx]).to be_within(1e-12).of(@parameter_value[idx]) }
    expect(@p == @p).to be true
    expect(@p == @not_p).to be false
    expect(@p != @not_p).to be true
    expect(@p.is_configured?).to be true
  end

end

describe Essentia::VectorStringParameter do

  before :example do
    @parameter_value = %w(one two three four five)
    @p = Essentia::VectorStringParameter.new(@parameter_value)
    @not_p = Essentia::VectorStringParameter.new(@parameter_value.map { |x| x + ' plus one' })
  end

  it 'has all the methods in place (VectorString)' do
    check_methods(@p)
  end

  it 'actually does work' do
    expect(@p.type).to eq(Essentia::ParamType::VECTOR_STRING)
    a = @p.to_vector_string
    a.each_index { |idx| expect(a[idx]).to(eq(@parameter_value[idx]), a[idx]) }
    expect(@p == @p).to be true
    expect(@p == @not_p).to be false
    expect(@p != @not_p).to be true
    expect(@p.is_configured?).to be true
  end

end

describe Essentia::VectorBoolParameter do

  before :example do
    @parameter_value = [true, false, false, true]
    @p = Essentia::VectorBoolParameter.new(@parameter_value)
    @not_p = Essentia::VectorBoolParameter.new(@parameter_value.map { |x| !x })
  end

  it 'has all the methods in place (VectorBool)' do
    check_methods(@p)
  end

  it 'actually does work' do
    expect(@p.type).to eq(Essentia::ParamType::VECTOR_BOOL)
    a = @p.to_vector_boolean
    a.each_index { |idx| expect(a[idx]).to(be(@parameter_value[idx]), a[idx].to_s) }
    expect(@p == @p).to be true
    expect(@p == @not_p).to be false
    expect(@p != @not_p).to be true
    expect(@p.is_configured?).to be true
  end

end

describe Essentia::VectorIntParameter do

  before :example do
    @parameter_value = [-((2**24)-1), 0, (2**24)-1]
    @p = Essentia::VectorIntParameter.new(@parameter_value)
    @not_p = Essentia::VectorIntParameter.new(@parameter_value.map { |x| x / 2 })
  end

  it 'has all the methods in place (VectorInt)' do
    check_methods(@p)
  end

  it 'actually does work' do
    expect(@p.type).to eq(Essentia::ParamType::VECTOR_INT)
    a = @p.to_vector_int
    a.each_index { |idx| expect(a[idx]).to(be(@parameter_value[idx]), a[idx].to_s) }
    expect(@p == @p).to be true
    expect(@p == @not_p).to be false
    expect(@p != @not_p).to be true
    expect(@p.is_configured?).to be true
  end

end

describe Essentia::VectorStereoSampleParameter do

  before :example do
    @parameter_value = [[-((2**24)-1), 0], [0, (2**24)-1]]
    @p = Essentia::VectorStereoSampleParameter.new(@parameter_value)
    @not_p = Essentia::VectorStereoSampleParameter.new(@parameter_value.map { |x| x.map { |xx| xx / 2 } })
  end

  it 'has all the methods in place (VectorStereoSample)' do
    check_methods(@p)
  end

  it 'actually does work' do
    expect(@p.type).to eq(Essentia::ParamType::VECTOR_STEREOSAMPLE)
    a = @p.to_vector_stereo_sample
    a.each_index do
      |idx|
      a[idx].each_index { |jdx| expect(a[idx][jdx]).to(be_within(1e-8).of(@parameter_value[idx][jdx]), a[idx][jdx].to_s) }
    end
    expect(@p == @p).to be true
    expect(@p == @not_p).to be false
    expect(@p != @not_p).to be true
    expect(@p.is_configured?).to be true
  end

end
