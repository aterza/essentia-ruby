require 'spec_helper'

describe EssentiaRuby do

  it 'has a version number' do
    expect(EssentiaRuby::VERSION).not_to be nil
  end

  it 'binds the proper constants' do
    consts = [EssentiaRuby::EssentiaException, EssentiaRuby::ForSingleFrames, EssentiaRuby::ForMultipleFrames,
              EssentiaRuby::ForAudioStream, EssentiaRuby::ForLargeAudioStream,
              EssentiaRuby::Parameter, EssentiaRuby::ParameterMap, EssentiaRuby::ParameterVector,
              EssentiaRuby::EssentiaMapSSScmp,
              EssentiaRuby::Configurable, 
              EssentiaRuby::Algorithm,
              EssentiaRuby::DescriptionMap, ]
    consts.each { |c| expect(defined?(c)).to eq('constant'), c.to_s }
  end

end
