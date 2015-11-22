class UsersController < ApplicationController
  def new
    @links = Link.all.sort_by { |link| link.votes }.reverse
    current_user
  end
end
