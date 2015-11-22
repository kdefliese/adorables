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
    link = Link.find(params[:id])
    Link.find(link).update(votes: link.votes + 1)

    redirect_to root_path
  end

  def downvote
    link = Link.find(params[:id])
    Link.find(link).update(votes: link.votes - 1)

    redirect_to root_path
  end

  def destroy

  end

  private

  def link_params
    link = params.require(:link).permit(:title, :url)
  end
end
