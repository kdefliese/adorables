# require 'uri'

class LinksController < ApplicationController
  def show

  end

  def new
    @link = Link.new
    @title = "Add"
    @action = "create"
  end

  def create
    if Link.create(link_params).valid?
      Link.last.update(user_id: session[:user_id])

      redirect_to root_path
    else
      redirect_to new_link_path, alert: "Invalid image URL."
    end
  end

  def upvote
    unless session[:user_id].nil?
      link = Link.find(params[:id])
      Link.find(link).update(votes: link.votes + 1)
      redirect_to root_path
    else
      redirect_to root_path, notice: "Please login."
    end
  end

  def downvote
    unless session[:user_id].nil?
      link = Link.find(params[:id])
      Link.find(link).update(votes: link.votes - 1)
      redirect_to root_path
    else
      redirect_to root_path, notice: "Please login."
    end
  end

  def destroy

  end

  private

  def link_params
    link = params.require(:link).permit(:title, :url)
  end
end
