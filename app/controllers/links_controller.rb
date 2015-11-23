# require 'uri'

class LinksController < ApplicationController
  def index
    @comment = Comment.new
    @action = "create"
    @links = Link.all.sort_by { |link| link.total_votes }.reverse
    current_user
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

  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
