class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      redirect_to item_path(comment.item), notice: 'コメントを投稿しました'
    else
      flash[:comment] = comment
      flash[:error_messages] = comment.errors.full_messages
      redirect_back fallback_location: comment.item
    end
  end

  # def create
  #   # comment = Comment.new(comment_params)
  #   # comment.user_id = current_user.id
  #   # if comment.save
  #   #   flash[:notice] = 'コメントを投稿しました'
  #   #   redirect_to comment.item

  #   # else
  #   #   flash[:comment] = comment
  #   #   flash[:error_messages] = comment.errors.full_messages
  #   #   redirect_back fallback_location: comment.item
  #   # end
  # end

  def destroy
    # item = Item.find(params[:item_id])
    # item.comments.find(params[:id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment.item, flash: { notice: 'コメント削除されました' }
  end

  private

  def comment_params
    params.require(:comment).permit(:item_id, :comment)
  end
end
