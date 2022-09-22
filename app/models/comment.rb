class Comment < ApplicationRecord
    belongs_to :post, inverse_of: :comments, foreign_key: :post_id, counter_cache: true
    belongs_to :user, inverse_of: :comments, foreign_key: :user_id, counter_cache: true

   # update comments counter

   def update_comment_counter
         post.update(comment_counter: post.comments.size)
    end

end