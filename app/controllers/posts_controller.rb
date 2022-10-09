class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.show_recent_posts
  end

  def show
    @current_user = current_user
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).order('created_at DESC')
  end

  def create
      @post = Post.new(params.require(:post).permit(:user, :title, :text))
      if @post.save
        flash[:success] = 'Post created!'

        redirect_to user_posts_path(@post.id)
      else
        flash[:danger] = 'Post not created!'
        redirect_to user_posts_path(@post.id)
      end
  end

  def new
    @post = Post.new
  end

  # private

  # def post_params
  #   params.require(:post).permit(:text, :title, :user_id, :postscounter, :commentscounter, :likescounter)
  # end
end

# @user = User.find(params[:user_id])
# @post = Post.new(post_params)
# @post.user = @user
# if @post.save
#   redirect_to user_posts_path(@user)
# else
#   render :new
# end
