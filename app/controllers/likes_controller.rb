class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.new(
      user_id: current_user.id,
      post_id: @post.id
    )

    if like.save
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", notice: 'Liked!'
    else
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", notice: 'Already liked!'
    end
  end
end
