require 'spec_helper'

#
# This is a spec for the proper wrapping of the Essentia::Streaming::Source
# class (really an Essentia::Streaming::RealVectorSource class since it is a
# template)
#

describe Essentia::Streaming::RealVectorSource do

   should_have_these_methods =
    [
      :parent, :setParent, :parentName, :fullName, # inherited connector methods
      :buffer, :totalProduced, :sinks, :getTokens, # inherited sourcebase methods
      :getFirstToken, :isProxied, :proxiedSinks, :push,
      :setBufferType, :BufferInfo, :setBufferInfo,
      :addReader, :removeReader, :attachProxy, :detachProxy,
      :typedBuffer, :tokens, :firstToken,          # actual Source methods
      :lastTokenProduced, :getTokens, :getFirstToken,
      :acquire, :release, :available, :reset 
    ]

  before :example do
    @rvs = Essentia::Streaming::RealVectorSource.new
  end

  it 'is created properly' do
    expect(@rvs).not_to be nil
  end

  should_have_these_methods.each do
    |m|
    it "responds to the \"#{m.to_s}\" method" do
      expect(@rvs.respond_to?(m)).to(be(true), m.to_s)
    end
  end

end
