class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
