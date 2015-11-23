class CommentsController < ApplicationController
  def new
    unless session[:user_id].nil?
      @comment = Comment.new
      @action = "create"
    else
      redirect_to root_path, notice: "Please login."
    end
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
