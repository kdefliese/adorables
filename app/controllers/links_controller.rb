require 'will_paginate/array'

class LinksController < ApplicationController
  before_filter :authenticate, only: [:new, :edit]
  before_filter :populate_comment_form, only: [:index, :show, :user_links, :user_votes, :user_comments]

  def index
    if params[:sort] == "hearts"
      links = Link.all.sort_by { |link| link.total_votes }.reverse
    else
      links = Link.all.reverse
    end
    @links = links.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @link = Link.find(params[:id])
  end

  def user_links
    if params[:sort] == "hearts"
      links = current_user.links.sort_by { |link| link.total_votes }.reverse
    else
      links = current_user.links.reverse
    end
    @links = links.paginate(:page => params[:page], :per_page => 5)
    render :index
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
    render :index
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
    render :index
  end

  def new
    @link = Link.new
    @action = "create"
    @what = "Add"
  end

  def create
    @link = Link.new(link_params)
    @action = "create"
    @what = "Add"
    if @link.save
      @link.update(user_id: session[:user_id])
      redirect_to links_path
    else
      flash[:alert] = "Invalid. URL ending must be PNG, JPG, JPEG or GIF."
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
    @action = "update"
    @what = "Update"

    render :new
  end

  def update
    @link = Link.find(params[:id])
    @link.attributes = link_params
    @action = "update"
    @what = "Update"
    if @link.save
      redirect_to links_path
    else
      flash[:alert] = "Invalid. URL ending must be PNG, JPG, JPEG or GIF."
      render :new
    end
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy

    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def authenticate
    redirect_to root_url, notice: "Please login." if current_user.nil?
  end

  def populate_comment_form
    ## for comment form
    @comment = Comment.new
    @action = "create"
    ##
  end
end
