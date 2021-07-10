class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @item_tags = @item.tags 
  end

  def new
  end

  def create
    @item = current_user.items.new(item_params)
    tag_list = params[:item][:tag_name].split(nil)
    if @item.save
      @item.save_tag(tag_list)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def update
  end

  private
    def item_params
     params.require(:item).permit(:name, :image_id, :description)
    end
end
