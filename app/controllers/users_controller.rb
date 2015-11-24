class UsersController < ApplicationController
  def new
    @disable_nav = true
    current_user
  end
end
