require 'spec_helper'

class Tester
  attr_reader :const, :args

  def initialize(c, a = [])
    @const = c
    @args = a
  end

  def init_obj
    self.args.empty? ? self.const.new : self.const.new(*self.args)
  end

end

describe EssentiaRuby do

  before(:example) do
    @creatable = {
      'EssentiaRuby::EssentiaException' => Tester.new(EssentiaRuby::EssentiaException, ['test_arg']),
      'EssentiaRuby::CaseInsensitiveStrCmp' => Tester.new(EssentiaRuby::CaseInsensitiveStrCmp),
      'EssentiaRuby::DescriptionMap' => Tester.new(EssentiaRuby::DescriptionMap),
      'EssentiaRuby::Parameter' => Tester.new(EssentiaRuby::Parameter, ['test_arg']),
      'EssentiaRuby::ParameterMap' => Tester.new(EssentiaRuby::ParameterMap),
      'EssentiaRuby::ParameterVector' => Tester.new(EssentiaRuby::ParameterVector),
      'EssentiaRuby::StreamingAlgorithmWrapper' => Tester.new(EssentiaRuby::StreamingAlgorithmWrapper),
    }
    consts_to_add = {
      'EssentiaRuby::InputBase' => Tester.new(EssentiaRuby::InputBase),
      'EssentiaRuby::OutputBase' => Tester.new(EssentiaRuby::OutputBase),
      'EssentiaRuby::TypeProxy' => Tester.new(EssentiaRuby::TypeProxy),
      'EssentiaRuby::ForSingleFrames' => Tester.new(EssentiaRuby::ForSingleFrames),
      'EssentiaRuby::ForMultipleFrames' => Tester.new(EssentiaRuby::ForMultipleFrames),
      'EssentiaRuby::ForAudioStream' => Tester.new(EssentiaRuby::ForAudioStream),
      'EssentiaRuby::ForLargeAudioStream' => Tester.new(EssentiaRuby::ForLargeAudioStream),
      'EssentiaRuby::Configurable' => Tester.new(EssentiaRuby::Configurable), 
      'EssentiaRuby::Algorithm' => Tester.new(EssentiaRuby::Algorithm),
      'EssentiaRuby::SourceBase' => Tester.new(EssentiaRuby::SourceBase),
      'EssentiaRuby::StreamingAlgorithm' => Tester.new(EssentiaRuby::StreamingAlgorithm),
      'EssentiaRuby::Dissonance' => Tester.new(EssentiaRuby::Dissonance),
      'EssentiaRuby::StreamingDissonance' => Tester.new(EssentiaRuby::StreamingDissonance),
    }
    @consts = Marshal.load(Marshal.dump(@creatable)) # this is a way to do a deep copy
    @consts.update(consts_to_add)
  end

  it 'has a version number' do
    expect(EssentiaRuby::VERSION).not_to be nil
  end

  it 'binds the proper constants' do
    @consts.values.each { |t| expect(defined?(t.const).class).to be(String), t.const.to_s }
  end

  it 'can actually create some objects' do
    @creatable.values.each do
      |t|
      expect(t.const.respond_to?(:new)).to be(true), t.const.to_s
      expect((obj = t.init_obj).class).to be(t.const), t.const.to_s
    end
  end

end
