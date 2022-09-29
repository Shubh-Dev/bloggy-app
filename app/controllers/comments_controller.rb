class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: @post.id)
  end

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, layout: { comment: @comment } }
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |_format|
      flash[:success] = 'Comment deleted!'
      redirect_to user_post_path(current_user, @comment.post)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html { render :edit, layout: { comment: @comment } }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |_format|
      if @comment.save
        flash[:success] = 'Comment created!'
        redirect_to user_post_path(current_user, @comment.post)
      else
        flash.now[:danger] = 'Error: Comment not created!'
        redirect_to new_post_comment_path(current_user)
      end
    end
  end

  private :comment_params
end
