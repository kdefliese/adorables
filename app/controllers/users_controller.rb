class UsersController < ApplicationController
  def new
    @comment = Comment.new
    @action = "create"
    @links = Link.all.sort_by { |link| link.votes }.reverse
    current_user
  end
end
