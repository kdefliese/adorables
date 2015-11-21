class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show

  end

  def new
    @link = Link.new
    @title = "Add"
    @action = "create"
  end

  def create
    Link.create(sale_params)

    redirect_to root_path
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def sale_params
    product = params.require(:link).permit(:title, :url)
  end
end
