require 'rails_helper'

RSpec.describe Comment, type: :model do
    subject { Comment.new(text: 'text') }

    before { subject.save }

    it 'text is present' do
        subject.text = nil
        expect(subject).to_not be_valid
    end

    it 'text length < 2 ' do
        subject.text = 't'
        expect(subject).to_not be_valid
    end

    it 'text length > 1000' do 
        subject.text = 't' * 1001
        expect(subject).to_not be_valid
    end

    it 'text length < 3 ' do
        subject.text = 'te'
        expect(subject).to_not be_valid
    end
end