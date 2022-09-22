require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(user_id: 1, post_id: 1) }

  before { subject.save }

  it 'user_id is present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'post_id is present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'user_id and post_id are unique' do
    subject.user_id = 1
    subject.post_id = 1
    expect(subject).to_not be_valid
  end
end
