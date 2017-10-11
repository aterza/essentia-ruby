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

describe Essentia::ParameterBase do

  before :example do
    @parameter_name = Essentia::ParamType::UNDEFINED
    @p = Essentia::ParameterBase.new(@parameter_name)
  end

  it 'can be created' do
    expect(@p).not_to be nil
  end

  methods =
  [
    :clear, :assign, :==, :!=, :type, :is_configured?, :to_s, :downcase,
    :to_boolean, :to_double, :to_f, :to_stereo_sample, :to_i, :to_real,
    :to_vector_real, :to_vector_string, :to_vector_int, :to_vector_boolean,
    :to_vector_stereo_sample, :to_vector_vector_real, :to_vector_vector_string,
    :to_vector_vector_stereo_sample, :to_vector_matrix_real, :to_map_vector_real,
    :to_map_vector_string, :to_map_real, :to_matrix_real,
  ]

  methods.each do
    |m|
    it "does have a #{m.to_s} method" do
      expect(@p.respond_to?(m)).to(be(true), m.to_s)
    end
  end

end
