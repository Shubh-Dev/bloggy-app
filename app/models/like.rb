class Like < ApplicationRecord
  belongs_to :post, inverse_of: :likes, foreign_key: :post_id, counter_cache: true
  belongs_to :user, inverse_of: :likes, foreign_key: :user_id, counter_cache: true
  # update likes counter

  after_save :update_like_counter

  def update_like_counter
    post.increment!(:likescounter)
  end
end
