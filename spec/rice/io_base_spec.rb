require 'spec_helper'

describe Essentia::Standard::InputBase do

  it 'exists' do
    expect(defined?(Essentia::Standard::InputBase)).to eq("constant")
  end

  it "*cannot* be created (it's a pure virtual)" do
    expect { Essentia::Standard::InputBase.new }.to raise_error(TypeError)
  end

end

describe Essentia::Standard::OutputBase do

  it 'exists' do
    expect(defined?(Essentia::Standard::OutputBase)).to eq("constant")
  end

  it "*cannot* be created (it's a pure virtual)" do
    expect { Essentia::Standard::OutputBase.new }.to raise_error(TypeError)
  end

end

describe Essentia::Streaming::SinkBase do

  it 'exists' do
    expect(defined?(Essentia::Streaming::SinkBase)).to eq("constant")
  end

  it "*cannot* be created (it's a pure virtual)" do
    expect { Essentia::Streaming::SinkBase.new }.to raise_error(TypeError)
  end

end

describe Essentia::Streaming::SourceBase do

  it 'exists' do
    expect(defined?(Essentia::Streaming::SourceBase)).to eq("constant")
  end

  it "*cannot* be created (it's a pure virtual)" do
    expect { Essentia::Streaming::SourceBase.new }.to raise_error(TypeError)
  end

end
