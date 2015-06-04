require 'spec_helper'

describe Lasslo do
  it 'has a version number' do
    expect(Lasslo::VERSION).not_to be nil
  end

  it 'has a valid class' do
    expect(Lasslo).not_to be nil
    password = Lasslo.generate(9)
    expect(password).to be(password)
    expect(password.length).to eq(9)
  end

  it 'does something useful' do
    expect(false).to eq(false)
  end
end
