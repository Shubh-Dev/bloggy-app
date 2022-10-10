class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post: @post.id)
  end

  def show
    @ser = User, find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit; end

  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    # puts user, post.commentscounter
    comment = params[:comment]
    new_comment = Comment.new(comment.permit(:text))
    new_comment.post_id = post.id

    if new_comment.save
      post.commentscounter += 1
      post.save
      redirect_to user_post_path(user, post)
    else
      render :new
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(params[:post_id])
    @post.commentscounter -= 1
    @comment.destroy
    @post.save

    flash[:notice] = 'Comment deleted'
    redirect_to user_post_path(current_user.id, @comment.post_id)
  end
end
