require 'will_paginate/array'

class LinksController < ApplicationController
  before_filter :authenticate, only: [:new, :edit]

  def index
    ## for comment form
    @comment = Comment.new
    @action = "create"
    ##

    if params[:sort] == "hearts"
      links = Link.all.sort_by { |link| link.total_votes }.reverse
      @links = links.paginate(:page => params[:page], :per_page => 5)
    else
      links = Link.all.reverse
      @links = links.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def show
    @link = Link.find(params[:id])
    ## for comment form
    @comment = Comment.new
    @action = "create"
    ##
  end

  def user_links
    ## for comment form
    @comment = Comment.new
    @action = "create"
    ##
    if params[:sort] == "hearts"
      links = current_user.links.sort_by { |link| link.total_votes }.reverse
      @links = links.paginate(:page => params[:page], :per_page => 5)
    else
      links = current_user.links.reverse
      @links = links.paginate(:page => params[:page], :per_page => 5)
    end
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
end
