class UsersController < ApplicationController
  def new
    @links = Link.all
    current_user
  end
end
