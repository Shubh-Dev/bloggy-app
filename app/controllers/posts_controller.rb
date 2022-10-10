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
    post = params[:post]
    user = User.find(params[:user_id])
    new_post = Post.new(post.permit(:title, :text))
    new_post.commentscounter = 0
    new_post.likescounter = 0
    new_post.author_id = user.id

    if new_post.save
      flash[:notice] = 'New post created successfully.'
      redirect_to user_post_url(user, new_post)
    else
      flash[:error] = 'Creating new post failed!'
      @post = new_post
      render :new
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
