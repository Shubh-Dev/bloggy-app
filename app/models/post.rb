class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', counter_cache: true
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, dependent: :destroy, foreign_key: :post_id
  validates :text, presence: true, length: { minimum: 3, maximum: 1000 }
  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def update_post_counter
    user.update(postscounter: user.posts.size)
  end

  # return the 5 most recent comments

  def show_recent_comments
    comments.order('created_at DESC').limit(5)
  end
end
