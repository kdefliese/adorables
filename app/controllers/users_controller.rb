class UsersController < ApplicationController

  def profile
    @user = current_user
    @links = current_user.links
    @comments = current_user.comments
    @votes = current_user.votes
  end

end
