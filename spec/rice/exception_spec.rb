require 'spec_helper'

describe 'Essentia exception handling' do

  it 'is actually catched by our wrappers' do
    # we cook up something to raise an exception
    expect((dm = Essentia::DescriptionMap.new)).not_to be nil
    expect { dm['non-existing tag'] }.to raise_error { |e| expect(e.message).to match(/^Essentia error: /) }
  end

end
