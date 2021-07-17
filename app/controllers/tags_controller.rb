class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def destroy
    tag = Tag.find(params[:id])
    if tag.destroy
      redirect_to tags_path, notice: 'タグを削除しました。'
    else
      @tags = Tag.all
      flash.now[:danger] = '削除に失敗しました。'
      render 'index'
    end
  end

  private

  def tag_params
    params.require(:tag).permit(tag_name)
  end

end
