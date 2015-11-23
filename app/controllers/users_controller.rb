class UsersController < ApplicationController
  def new
    @comment = Comment.new
    @action = "create"
    @links = Link.all.sort_by { |link| link.total_votes }.reverse
    current_user
  end
end
