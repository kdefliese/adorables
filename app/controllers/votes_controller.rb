 class VotesController < ApplicationController
  def heart
    unless session[:user_id].nil?
      vote = Link.find(params[:link_id]).votes.where(user_id: current_user.id)

      if vote.empty?
        Vote.create({value: 1, user_id: session[:user_id], link_id: params[:link_id]})
      elsif vote.first.value == 1
        Vote.update(vote.first.id, value: 0)
      elsif vote.first.value == 0
        Vote.update(vote.first.id, value: 1)
      end

      redirect_to links_path(anchor: "link_#{params[:link_id]}")
    else
      redirect_to root_path, notice: "Please login."
    end
  end
end
