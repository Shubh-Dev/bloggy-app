class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(params[:comment])
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_post_path(current_user.id, params[:post_id])
    else
      render :create
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
