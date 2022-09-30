require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'title', text: 'text', commentscounter: 5, likescounter: 4) }

  before { subject.save }

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'commentcounter has a numeric value' do
    expect(subject.commentscounter).to be_an(Integer)
  end

  it 'likescounter has a numeric value' do
    expect(subject.likescounter).to be_an(Integer)
  end

  it 'is invalid if commentscounter value is not an integer' do
    subject.commentscounter = 'a'
    expect(subject).to_not be_valid
  end

  # it 'commentscounter increases when a comment is added' do
  #   subject.commentscounter = 5
  #   subject.save
  #   expect(subject.commentscounter).to eq(5)
  # end
end
