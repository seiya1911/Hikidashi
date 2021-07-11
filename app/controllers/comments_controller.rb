class CommentsController < ApplicationController
  def create
    @drawer = Drawer.find(params[:drawer_id])
    @comment = Comment.new(comment_params)
    @comment.drawer_id = @drawer.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to drawer_path(@drawer), notice: 'コメントを送信しました。'
    else
      @drawer = Drawer.find(params[:drawer_id])
      flash.now[:danger] = '送信に失敗しました。'
      render 'drawers/show'
    end
  end

  def destroy
    @drawer = drawer.find(params[:drawer_id])
    comment = @drawer.comments.find(params[:id])
    if comment.destroy!
      redirect_to drawer_path(@drawer), notice: 'コメントを削除しました。'
    else
      @drawer = Drawer.find(params[:drawer_id])
      flash.now[:danger] = '削除に失敗しました。'
      render 'drawers/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
