class CommentsController < ApplicationController
  before_filter :authenticate, only: [:create]

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

    redirect_to links_path(anchor: "link_#{params[:link_id]}")
  end

  private

  def comment_params
    comment = params.require(:comment).permit(:comment)
    comment.merge(params.permit(:link_id))
  end

  def authenticate
    redirect_to root_url, notice: "Please login." if current_user.nil?
  end
end
