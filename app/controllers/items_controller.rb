class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @item_tags = @item.tags
  end

  def new
    @drawer = Drawer.find(params[:drawer_id])
    @item = @drawer.items.new

  end

  def create
    drawer = Drawer.find(params[:drawer_id])
    @item = drawer.items.new(item_params)
    @item.user_id = current_user.id
    tag_list = params[:item][:tag_name].split(",")
    if @item.save
      @item.save_tag(tag_list)
      redirect_to drawer_item_path(drawer, @item), notice: 'Itemを作成しました。'
    else
      @drawer = Drawer.find(params[:drawer_id])
      @item = @drawer.items.new
      flash.now[:danger] = '作成に失敗しました。'
      render 'new'
    end
  end

  def edit
    @drawer = Drawer.find(params[:drawer_id])
    @item = Item.find(params[:id])
    @tag_list = @item.tags.pluck(:tag_name).join(",")
  end

  def update
    @item = Item.find(params[:id])
    @drawer = Drawer.find(params[:drawer_id])
    tag_list = params[:item][:tag_name].split(",")
    if @item.update_attributes(item_params)
      @item.save_tag(tag_list)
      redirect_to drawer_item_path(@drawer, @item), notice: 'Itemを編集しました。'
    else
      @drawer = Drawer.find(params[:drawer_id])
      @item = Item.find(params[:id])
      @tag_list = @item.tags.pluck(:tag_name).join(",")
      flash.now[:danger] = '編集に失敗しました。'
      render 'edit'
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to drawer_path(item.drawer_id), notice: 'Itemを削除しました。'
    else
      @ditem = Item.find(params[:item_id])
      flash.now[:danger] = '削除に失敗しました。'
      render 'item/show'
    end
  end

  def sort
    item = Item.find(params[:item_id])
    item.update(item_params)
    render nothing: true
  end

  private
    def item_params
     params.require(:item).permit(:name, :image, :description, :row_order_position)
    end
end
