class LinksController < ApplicationController
  before_filter :authenticate, only: [:new]

  def index
    @comment = Comment.new
    @action = "create"
    if params[:sort] == "hearts"
      @links = Link.all.sort_by { |link| link.total_votes }.reverse
    else
      @links = Link.all
    end
  end

  def new
    @link = Link.new
    @title = "Add"
    @action = "create"
  end

  def create
    if Link.create(link_params).valid?
      Link.last.update(user_id: session[:user_id])

      redirect_to links_path
    else
      redirect_to new_link_path, alert: "Invalid image URL."
    end
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy

    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def authenticate
    redirect_to root_url, notice: "Please login." if current_user.nil?
  end
end
