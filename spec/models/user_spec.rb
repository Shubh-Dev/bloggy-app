require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'test name', photo: 'test photo', bio: 'test bio', postscounter: 0) }
  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is postcounter is not valid' do
    subject.postscounter = nil
    expect(subject).to_not be_valid
  end

  it 'is value a number' do
    subject.postscounter = 1
    expect(subject.postscounter).to be_a_kind_of(Integer)
  end

  it 'is value greater than or equal to 0' do
    subject.postscounter = 0
    expect(subject.postscounter).to be >= 0
  end

  it 'phote is not mandatory' do
    subject.photo = nil
    expect(subject).to be_valid
  end
end
