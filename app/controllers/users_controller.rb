class UsersController < ApplicationController
  def new
    if current_user
      redirect_to links_path
    else
      @disable_nav = true
      current_user
    end
  end
end
