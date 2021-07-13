class DrawersController < ApplicationController

  def index
    @drawers = Drawer.all
  end

  def show
    @drawer = Drawer.find(params[:id])
    @comment = Comment.new
    @items = @drawer.items
    @item = Item.new
  end

  def new
    @drawer = Drawer.new
  end

  def create
    @drawer = Drawer.new(drawer_params)
    @drawer.user_id = current_user.id
    if @drawer.save
      redirect_to drawer_path(@drawer), notice: '新規Drawerを作成しました。'
    else
      @drawers = drawer.all
      flash.now[:danger] = '新規作成に失敗しました。'
      render 'index'
    end
  end

  def edit
    @drawer = Drawer.find(params[:id])
  end

  def update
    if @drawer.update(drawer_params)
      redirect_to drawer_path(@drawer), notice: 'Drawerを更新しました。'
    else
      flash.now[:danger] = '更新に失敗しました。'
      render 'edit'
    end
  end

  private

  def drawer_params
    params.require(:drawer).permit(:name, :image, :description)
  end
end
