class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: :user_id
  has_many :comments, dependent: :destroy, foreign_key: :user_id
  has_many :likes, dependent: :destroy, inverse_of: :user, foreign_key: :user_id
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :postscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def show_recent_posts
    posts.order('created_at DESC').limit(3)
  end
end
