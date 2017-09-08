require 'spec_helper'

describe 'Essentia setup (init/shutdown)' do

  methods = [:init, :is_initialized?, :shutdown]

  methods.each do
    |m|
    it "does have a #{m.to_s} method" do
      expect(Essentia.respond_to?(m)).to be true
    end
  end

  it 'can actually initialize and shutdown Essentia' do
    expect(Essentia.is_initialized?).to be false
    expect(Essentia.init).to be nil
    expect(Essentia.is_initialized?).to be true
    expect(Essentia.shutdown).to be nil
    expect(Essentia.is_initialized?).to be false
  end

end

