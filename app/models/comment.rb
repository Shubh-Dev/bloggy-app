class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post'
  belongs_to :user,  foreign_key: :user_id, class_name: 'User'
  validates :text, presence: true, length: { minimum: 3, maximum: 1000 }

  # update comments counter

  after_save :update_comment_counter

  def update_comment_counter
    post.increment!(:commentscounter)
  end
end
