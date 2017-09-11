require 'spec_helper'

describe 'Essentia modules' do

  modules = [Essentia, Essentia::Standard, Essentia::Streaming, Essentia::Scheduler, ]

  modules.each do
    |m|
    it "does have a #{m.to_s} module" do
      expect(m.is_a?(Module)).to be true
      expect(!m.is_a?(Class)).to be true
    end
  end

end
