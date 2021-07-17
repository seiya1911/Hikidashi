class SearchesController < ApplicationController
  def items
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    render 'searches'
  end

  def tag_items
    @items = params[:tag_id].present? ? Tag.find(params[:tag_id]).items : Item.all
    render 'tag_searches'
  end

  def drawers
    @drawers = Drawer.search(params[:keyword])
    @keyword = params[:keyword]
    render 'drawer_searches'
  end
end
