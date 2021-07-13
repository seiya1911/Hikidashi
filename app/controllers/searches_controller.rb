class SearchesController < ApplicationController
  def items
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    render 'searches'
  end
end
