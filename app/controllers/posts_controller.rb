class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user: @user).order('created_at DESC')
  end

  def show
    @current_user = current_user
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).order('created_at DESC')
  end

  def create
    @post = current_user.posts.new(post_params)
    if post.save
      redirect_to "/users/#{@post.user.id}/posts/#{@post.id}"
    else
      render :new
  end
end

def new
  @post = Post.new
  render new
end

private

def post_params

params.require(:post).permit(:text, :title, :user_id, :postscounter, :commentscounter, :likescounter)
end


end
