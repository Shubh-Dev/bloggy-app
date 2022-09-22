class User < ApplicationRecord
  has_many :posts, dependent: :destroy, inverse_of: :user, foreign_key: :user_id
  has_many :comments, dependent: :destroy, inverse_of: :user, foreign_key: :user_id
  has_many :likes, dependent: :destroy, inverse_of: :user, foreign_key: :user_id

  def show_recent_posts
    posts.order('created_at DESC').limit(3)
  end
end
