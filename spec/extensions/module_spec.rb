require 'extensions/module'

module A
  module B
    module C
    end
  end
end

describe 'Module extensions' do

  before :example do
    @m = A::B::C
  end

  it 'has a demodulized_name method' do
    expect(@m.respond_to?(:demodulized_name)).to be true
  end

  it 'has a working demodulized_name method' do
    expect(@m.demodulized_name).to eq('C')
  end

  it 'has an algorithm_name method' do
    expect(@m.respond_to?(:algorithm_name)).to be true
  end

  it 'has a working algorithm_name method' do
    expect(@m.algorithm_name).to eq('C')
  end

end
