class UsersController < ApplicationController
  def new
    if current_user
      redirect_to links_path
    end
    @disable_nav = true
  end
end
