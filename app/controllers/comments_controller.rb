class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.create(comment_params)

    if comment.save
      redirect_to "/posts/#{comment.post.id}", notice: 'コメントに成功しました'
    else
      redirect_to post_path(params[:post_id]), notice: 'コメントに失敗しました'
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy

    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
