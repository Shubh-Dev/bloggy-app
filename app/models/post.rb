class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts, foreign_key: :user_id, counter_cache: true
  has_many :comments, dependent: :destroy, inverse_of: :post, foreign_key: :post_id
  has_many :likes, dependent: :destroy, inverse_of: :post, foreign_key: :post_id
  validates :text, presence: true, length: { minimum: 3, maximum: 1000 }
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :commentscounter, numericality: { only_integer: true }
  validates :likescounter, numericality: { only_integer: true }
  

  after_save :update_post_counter

  def update_post_counter
    user.increment!(:postscounter)
  end

  # return the 5 most recent comments

  def show_recent_comments
    comments.order('created_at DESC').limit(5)
  end
end
