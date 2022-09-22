class Like < ApplicationRecord
    belongs_to :post, inverse_of: :likes, foreign_key: :post_id, counter_cache: like_counter
    belongs_to :user, inverse_of: :likes, foreign_key: :user_id, counter_cache: post_counter
    # update likes counter

    def update_like_counter
        self.post.update(like_counter: self.post.likes.count)
    end

end