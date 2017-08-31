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

describe Essentia do

  before(:example) do
    @af = Essentia::AlgorithmFactory.instance
    @creatable = {
      'Essentia::EssentiaException' => Tester.new(Essentia::EssentiaException, ['test_arg']),
      'Essentia::CaseInsensitiveStrCmp' => Tester.new(Essentia::CaseInsensitiveStrCmp),
      'Essentia::DescriptionMap' => Tester.new(Essentia::DescriptionMap),
      'Essentia::Parameter' => Tester.new(Essentia::Parameter, ['test_arg']),
      'Essentia::ParameterMap' => Tester.new(Essentia::ParameterMap),
      'Essentia::ParameterVector' => Tester.new(Essentia::ParameterVector),
      'Essentia::StreamingAlgorithmWrapper' => Tester.new(Essentia::StreamingAlgorithmWrapper),
      'Essentia::Dissonance' => Tester.new(Essentia::Dissonance),
      'Essentia::StreamingDissonance' => Tester.new(Essentia::StreamingDissonance),
      'Essentia::MonoLoader' => Tester.new(Essentia::MonoLoader),
      'Essentia::StreamingMonoLoader' => Tester.new(Essentia::StreamingMonoLoader),
    }
    consts_to_add = {
      'Essentia::InputBase' => Tester.new(Essentia::InputBase),
      'Essentia::OutputBase' => Tester.new(Essentia::OutputBase),
      'Essentia::TypeProxy' => Tester.new(Essentia::TypeProxy),
      'Essentia::ForSingleFrames' => Tester.new(Essentia::ForSingleFrames),
      'Essentia::ForMultipleFrames' => Tester.new(Essentia::ForMultipleFrames),
      'Essentia::ForAudioStream' => Tester.new(Essentia::ForAudioStream),
      'Essentia::ForLargeAudioStream' => Tester.new(Essentia::ForLargeAudioStream),
      'Essentia::Configurable' => Tester.new(Essentia::Configurable), 
      'Essentia::Algorithm' => Tester.new(Essentia::Algorithm),
      'Essentia::SourceBase' => Tester.new(Essentia::SourceBase),
      'Essentia::StreamingAlgorithm' => Tester.new(Essentia::StreamingAlgorithm),
    }
    @consts = Marshal.load(Marshal.dump(@creatable)) # this is a way to do a deep copy
    @consts.update(consts_to_add)
    @algorithms = ['MonoLoader', 'Dissonance']
  end

  it 'has a version number' do
    expect(Essentia::Ruby::VERSION).not_to be nil
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

  it 'has a factory that can create algorithm objects' do
    @algorithms.each do
      |algo|
      expect((a = @af.create(algo)).kind_of?(Essentia::Algorithm)).to be(true)
      expect(a.respond_to?(:compute)).to be(true)
    end
  end

end
