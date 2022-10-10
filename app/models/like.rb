class Like < ApplicationRecord
  belongs_to :post, inverse_of: :likes, foreign_key: :post_id
  belongs_to :user, inverse_of: :likes, foreign_key: :author_id
  validates :user_id, uniqueness: { scope: :post_id }
  # update likes counter

  after_save :update_like_counter

  def update_like_counter
    post.increment!(:likescounter)
  end
end
