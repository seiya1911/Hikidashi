class DrawersController < ApplicationController

  def index
    @user = current_user
    @drawers = @user.drawers.page(params[:page]).per(8)
  end

  def show
    @drawer = Drawer.find(params[:id])
    @comment = Comment.new
    @items = @drawer.items.rank(:row_order)
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
      @drawers = Drawer.all
      flash.now[:danger] = '新規作成に失敗しました。'
      render 'index'
    end
  end

  def edit
    @drawer = Drawer.find(params[:id])
  end

  def update
    @drawer = Drawer.find(params[:id])
    if @drawer.update(drawer_params)
      redirect_to drawer_path(@drawer), notice: 'Drawerを更新しました。'
    else
      flash.now[:danger] = '更新に失敗しました。'
      render 'edit'
    end
  end

  def destroy
    drawer = Drawer.find(params[:id])
    if drawer.destroy
      redirect_to drawers_path, notice: 'Drawerを削除しました。'
    else
      @drawer = Drawer.find(params[:drawer_id])
      flash.now[:danger] = '削除に失敗しました。'
      render 'drawers/show'
    end
  end

  private

  def drawer_params
    params.require(:drawer).permit(:name, :image, :description)
  end
end
