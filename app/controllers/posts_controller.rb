class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = Post.where(user: @user.user_id)
  end

  def show
    @user_post = Post.find(params[:user_id])
  end
end
