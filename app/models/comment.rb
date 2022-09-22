class Comment < ApplicationRecord
  belongs_to :post, inverse_of: :comments, foreign_key: :post_id, counter_cache: true
  belongs_to :user, inverse_of: :comments, foreign_key: :user_id, counter_cache: true

  # update comments counter

  after_save :update_comment_counter

  def update_comment_counter
    post.increment!(:commentscounter)
  end
end