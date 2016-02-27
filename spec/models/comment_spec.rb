require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'description valid' do
    it 'is valid if description is correct' do
      comment = Comment.new(description: "Comment 1")
      expect(comment.valid?).to eq(true)
    end

    it 'is invalid if description is correct' do
      comment = Comment.new(description: "")
      expect(comment.valid?).to eq(false)
    end
  end
end
