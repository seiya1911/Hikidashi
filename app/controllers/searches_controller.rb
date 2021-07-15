class SearchesController < ApplicationController
  def items
    @items = Item.search(params[:keyword])
    @item = params[:tag_id].present? ? Tag.find(params[:tag_id]).items : Item.all
    @keyword = params[:keyword]
    render 'searches'
  end

  def tag_items
    @items = params[:tag_id].present? ? Tag.find(params[:tag_id]).items : Item.all
    render 'searches'
  end
end
