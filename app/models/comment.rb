class Comment < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  belongs_to :user, foreign_key: :author_id
  validates :text, presence: true, length: { minimum: 3, maximum: 1000 }

  # update comments counter

  after_save :update_comment_counter

  def update_comment_counter
    post.increment!(:commentscounter)
  end
end
