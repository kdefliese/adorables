class UsersController < ApplicationController
  before_filter :populate_comment_form, only: [:user_links, :user_votes, :user_comments]

  def profile
    @user = current_user
    @links = current_user.links
    @comments = current_user.comments
    @votes = current_user.votes.where(value: 1)
  end

  def user_links
    if params[:sort] == "hearts"
      links = current_user.links.sort_by { |link| link.total_votes }.reverse
    else
      links = current_user.links.reverse
    end
    @links = links.paginate(:page => params[:page], :per_page => 5)
    render :template => 'links/index'
  end

  def user_votes
    votes = current_user.votes
    link_ids = []
    votes.each do |vote|
      link_ids.push(vote.link_id)
    end
    if params[:sort] == "hearts"
      links = Link.find(link_ids).sort_by { |link| link.total_votes }.reverse
    else
      links = Link.find(link_ids).reverse
    end
    @links = links.paginate(:page => params[:page], :per_page => 5)
    render :template => 'links/index'
  end

  def user_comments
    comments = current_user.comments
    link_ids = []
    comments.each do |comment|
      link_ids.push(comment.link_id)
    end
    if params[:sort] == "hearts"
      links = Link.find(link_ids).sort_by { |link| link.total_votes }.reverse
    else
      links = Link.find(link_ids).reverse
    end
    @links = links.paginate(:page => params[:page], :per_page => 5)
    render :template => 'links/index'
  end

  private

  def populate_comment_form
    ## for comment form
    @comment = Comment.new
    @action = "create"
    ##
  end

end
