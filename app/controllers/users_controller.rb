class UsersController < ApplicationController

  def profile
    @user = current_user
    @links = current_user.links
    @comments = current_user.comments
    @votes = current_user.votes.where(value: 1)
  end

end
