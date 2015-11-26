 class VotesController < ApplicationController
  before_filter :authenticate, only: [:create, :update]

  def create
    Vote.create({value: 1, user_id: session[:user_id], link_id: params[:link_id]})

    redirect_to links_path(anchor: "link_#{params[:link_id]}")
  end

  def update
    vote = Vote.find(params[:id])
    if vote.value == 1
      vote.update(value: 0)
    elsif vote.value == 0
      vote.update(value: 1)
    end

    redirect_to links_path(anchor: "link_#{params[:link_id]}")
  end

  private

  def authenticate
    redirect_to root_url, notice: "Please login." if current_user.nil?
  end
end
