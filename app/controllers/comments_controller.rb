class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @action = "create"
  end

  def create
    Comment.create(comment_params)
    Comment.last.update(user_id: session[:user_id])

    redirect_to root_path
  end

  private

  def comment_params
    comment = params.require(:comment).permit(:comment)
    comment.merge(params.permit(:link_id))
  end
end
