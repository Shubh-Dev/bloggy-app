class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user: @user).order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    render new, layout: { post: @new_post } 
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    if post.save
      redirect_to user_post_path(current_user, post)
    else
      render :new
  end
end

private

def post_params

params.require(:post).permit(:text, :title, :user_id, :postscounter, :commentscounter, :likescounter)
end


end
