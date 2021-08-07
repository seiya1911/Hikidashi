class SearchesController < ApplicationController
  def search
    @user = current_user
    @items = @user.items
  end

  def items
    @items = Item.search(current_user.id, params[:keyword])
    @keyword = params[:keyword]
    render 'searches'
  end

  def tag_items
    user = current_user
    @items = params[:tag_id].present? ? Tag.find(params[:tag_id]).items : user.items
    render 'tag_searches'
  end

  def drawers
    @drawers = Drawer.search(current_user.id, params[:keyword])
    @keyword = params[:keyword]
    render 'drawer_searches'
  end
end
