class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user: @user).order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end
end
