require 'spec_helper'

describe EssentiaRuby::OptionSet do

  before :example do
    @runtime_opts = { 'this' => 1.0, 'that' => 23.0 }
    @default_opts = { 'this' => 10.0, 'that' => 23.0, 'the_other' => 'sixteen' }
    @os = EssentiaRuby::OptionSet.new('test', @default_opts, @runtime_opts)
    @os_with_no_rh = EssentiaRuby::OptionSet.new('test', @default_opts)
    @out_methods = [nil, :toReal, :toString]
  end

  it 'can be created with different arguments' do
    expect(@os).not_to be nil
    expect(@os.is_a?(EssentiaRuby::OptionSet)).to be true
    expect(@os_with_no_rh).not_to be nil
    expect(@os_with_no_rh.is_a?(EssentiaRuby::OptionSet)).to be true
  end

  it 'sets up the essentia parameters properly with runtime options' do
    osp_should_be = [ 'this', EssentiaRuby::Parameter.new(1.0), 'that', EssentiaRuby::Parameter.new(23.0), 'the_other', EssentiaRuby::Parameter.new('sixteen') ]
    @os.to_essentia_parameters.each_index do
      |idx|
      p = @os.to_essentia_parameters[idx]
      psb = osp_should_be[idx]
      value = p.is_a?(EssentiaRuby::Parameter) ? p.send(@out_methods[psb.type]) : p
      expected_value = psb.is_a?(EssentiaRuby::Parameter) ? psb.send(@out_methods[psb.type]) : psb
      expect(p.class).to eq(psb.class)
      expect(value).to eq(expected_value)
    end
  end

  it 'sets up the essentia parameters properly without runtime options' do
    ospnorh_should_be = [ 'this', EssentiaRuby::Parameter.new(10.0), 'that', EssentiaRuby::Parameter.new(23.0), 'the_other', EssentiaRuby::Parameter.new('sixteen') ]
    @os_with_no_rh.to_essentia_parameters.each_index do
      |idx|
      p = @os_with_no_rh.to_essentia_parameters[idx]
      psb = ospnorh_should_be[idx]
      value = p.is_a?(EssentiaRuby::Parameter) ? p.send(@out_methods[psb.type]) : p
      expected_value = psb.is_a?(EssentiaRuby::Parameter) ? psb.send(@out_methods[psb.type]) : psb
      expect(p.class).to eq(psb.class)
      expect(value).to eq(expected_value)
    end
  end

  it 'sets up methods for each parameter (properly)' do
    @os.default_hash.keys { |m| expect(@os.respond_to?(m)).to be true }
    @os.default_hash.each { |k, v| expect(@os.send(k)).to eq(EssentiaRuby::Parameter.new(v)) }
    @os_with_no_rh.default_hash.keys { |m| expect(@os_with_no_rh.respond_to?(m)).to be true }
    @os_with_no_rh.default_hash.each { |k, v| expect(@os_with_no_rh.send(k)).to eq(EssentiaRuby::Parameter.new(v)) }
  end

end

describe EssentiaRuby::OptionManager do

  before :example do
    @runtime_opts = { 'this' => 1.0, 'that' => 23.0 }
    @default_opts = { 'this' => 10.0, 'that' => 23.0, 'the_other' => 'sixteen' }
    @os1 = EssentiaRuby::OptionSet.new('test 1', @default_opts, @runtime_opts)
    @os2 = EssentiaRuby::OptionSet.new('test 2', @default_opts, @runtime_opts)
    @out_methods = [nil, :toReal, :toString]
    @dh = { 'this' => 1.0 }
    @rh = { 'this' => 2.0 }
    @params = [ 'this', EssentiaRuby::Parameter.new(2.0) ]
  end

  it 'can be created (with no arguments)' do
    expect(EssentiaRuby::OptionManager.new).not_to be nil
  end

  it 'can receive OptionSet objects and updates to them' do
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    [@os1, @os2].each { |os| om << os }
    ['test 1', 'test 2'].each { |t| expect(om.respond_to?(t)).to be true }
    [['test 1', @os1], ['test 2', @os2]].each { |os| expect(om.send(os[0])).to eq(os[1]) }
  end

  it 'raises an ArgumentError if a wrong argument is passed' do
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    expect { om << 'wrong argument' }.to raise_error(ArgumentError)
  end

  it 'returns the option set through the [] operator' do
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    [@os1, @os2].each { |os| om << os }
    [['test 1', @os1], ['test 2', @os2]].each { |os| expect(om[os[0]]).to eq(os[1]) }
  end

  it 'has a handle_defaults() method' do
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    expect(om.respond_to?(:handle_defaults)).to be true
  end

  it 'has a handle_defaults() method that raises an ArgumentError if called with no arguments' do
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    expect{ om.handle_defaults }.to raise_error(ArgumentError, "arguments must be two or multiples of two")
  end

  it 'has a handle_defaults() method that raises an ArgumentError if called with a number of args that is not a multiple of two' do
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    expect{ om.handle_defaults(1, 2, 3, 4, 5) }.to raise_error(ArgumentError, "arguments must be multiples of two")
  end

  it 'has a handle_defaults() method that raises an ArgumentError if arguments are not a String or Symbol, Hash tuplet' do
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    error_msg = 'arguments must be in the form: string (or symbol), hash, string (or symbol), hash, ... etc.'
    expect{ om.handle_defaults(1, 2) }.to raise_error(ArgumentError, error_msg)
    expect{ om.handle_defaults('test 3', @dh, 1, 2) }.to raise_error(ArgumentError, error_msg)
    expect{ om.handle_defaults(1, 2, 'test 4', @dh) }.to raise_error(ArgumentError, error_msg)
    expect{ om.handle_defaults(:test_5, @dh, 1, 2) }.to raise_error(ArgumentError, error_msg)
    expect{ om.handle_defaults(1, 2, :test_6, @dh) }.to raise_error(ArgumentError, error_msg)
  end

  it 'has a handle_defaults() method that loads all option in the proper place' do
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    om.handle_defaults('test 6', @dh, :test_7, @dh)
    expect(om['test 6'].is_a?(EssentiaRuby::OptionSet)).to be true
    expect(om['test_7'].is_a?(EssentiaRuby::OptionSet)).to be true
    expect(om[:test_7]).to be nil
    ['test 6', 'test_7'].each do
      |tag|
      expect(om[tag].default_hash).to eq(@dh)
      expect(om[tag].runtime_hash).to eq({})
      expect(om[tag].to_essentia_parameters.first).to eq('this')
      expect(om[tag].to_essentia_parameters.last.toReal).to eq(@dh['this'])
    end
  end

  it 'has a handle_runtime_options() method' do
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    expect(om.respond_to?(:handle_runtime_options)).to be true
  end

  it 'has a handle_runtime_options() method that raises an ArgumentError if called with no arguments' do
    error_msg = 'wrong number of arguments (given 0, expected 1)'
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    expect{ om.handle_runtime_options }.to raise_error do
      |error|
      expect(error.class).to eq(ArgumentError)
      expect(error.message).to eq(error_msg)
    end
  end

  it 'has a handle_runtime_options() method that raises an ArgumentError if called with an argument that is not a hash of hashes' do
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    error_msg = "argument must be an hash of hashes" 
    expect{ om.handle_runtime_options([1, 2, 3, 4, 5]) }.to raise_error do
      |error|
      expect(error.class).to eq(ArgumentError)
      expect(error.message).to eq(error_msg)
    end
  end

  it 'has a handle_runtime_options() method that raises an ArgumentError if hash of hashes does contain an unknown tag' do
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    tag = 'unknown tag'
    error_msg = "OptionSet \"#{tag}\" not found"
    expect{ om.handle_runtime_options({ tag => {}}) }.to raise_error do
      |error|
      expect(error.class).to eq(ArgumentError)
      expect(error.message).to eq(error_msg)
    end
  end

  it 'has a handle_runtime_options() method that loads all option in the proper place' do
    expect((om = EssentiaRuby::OptionManager.new)).not_to be nil
    om.handle_defaults('test 6', @dh, :test_7, @dh)
    om.handle_runtime_options({ 'test 6' => @rh, :test_7 => @rh })
    expect(om['test 6'].is_a?(EssentiaRuby::OptionSet)).to be true
    expect(om['test_7'].is_a?(EssentiaRuby::OptionSet)).to be true
    expect(om[:test_7]).to be nil
    ['test 6', 'test_7'].each do
      |tag|
      expect(om[tag].default_hash).to eq(@dh)
      expect(om[tag].runtime_hash).to eq(@rh)
      expect(om[tag].to_essentia_parameters).to eq(@params)
      expect(om[tag].to_essentia_parameters.first).to eq('this')
      expect(om[tag].to_essentia_parameters.last).to eq(@params.last)
    end
  end

end

# 
# describe 'EssentiaRuby::Helpers::Option.handle' do
# 
#   before :example do
#     @h1 = { 'this' => 1.0 }
#     @h2 = { 'this' => 2.0 }
#     @params = [ 'this', EssentiaRuby::Parameter.new(2.0) ]
#   end
# 
#   it 'raises an ArgumentError if called with no arguments' do
#     expect{ EssentiaRuby::Helpers::Option.handle }.to raise_error(ArgumentError, "arguments must be three or multiples of three")
#   end
# 
#   it 'raises an ArgumentError if called with a number of args that is not a multiple of three' do
#     expect{ EssentiaRuby::Helpers::Option.handle(1, 2, 3, 4) }.to raise_error(ArgumentError, "arguments must be multiples of three")
#   end
# 
#   it 'raises an ArgumentError if arguments are not a String or Symbol, Hash, Hash triplet' do
#     expect{ EssentiaRuby::Helpers::Option.handle(1, 2, 3) }.to raise_error(ArgumentError, 'arguments must be in the form: string (or symbol), hash, hash, ... etc.')
#     expect{ EssentiaRuby::Helpers::Option.handle('test 3', @h1, @h2, 1, 2, 3) }.to raise_error(ArgumentError, 'arguments must be in the form: string (or symbol), hash, hash, ... etc.')
#     expect{ EssentiaRuby::Helpers::Option.handle(1, 2, 3, 'test 4', @h1, @h2) }.to raise_error(ArgumentError, 'arguments must be in the form: string (or symbol), hash, hash, ... etc.')
#     expect{ EssentiaRuby::Helpers::Option.handle(:test_5, @h1, @h2, 1, 2, 3) }.to raise_error(ArgumentError, 'arguments must be in the form: string (or symbol), hash, hash, ... etc.')
#     expect{ EssentiaRuby::Helpers::Option.handle(1, 2, 3, :test_6, @h1, @h2) }.to raise_error(ArgumentError, 'arguments must be in the form: string (or symbol), hash, hash, ... etc.')
#   end
# 
#   it 'creates an OptionManager with all option sets in the proper place' do
#     expect((om = EssentiaRuby::Helpers::Option.handle('test 6', @h1, @h2, :test_7, @h1, @h2)).is_a?(EssentiaRuby::OptionManager)).to be true
#     expect(om['test 6'].is_a?(EssentiaRuby::OptionSet)).to be true
#     expect(om['test_7'].is_a?(EssentiaRuby::OptionSet)).to be true
#     expect(om[:test_7]).to be nil
#     ['test 6', 'test_7'].each do
#       |tag|
#       expect(om[tag].default_hash).to eq(@h1)
#       expect(om[tag].runtime_hash).to eq(@h2)
#       expect(om[tag].to_essentia_parameters).to eq(@params)
#     end
#   end
# 
# end
