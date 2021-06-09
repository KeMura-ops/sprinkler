class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.includes(:tags).limit(10).order(created_at: :desc)
  end

  def timeline # 自分自身とフォローしているユーザーの投稿を取得する
    @posts = Post.includes(:tags, :nices).where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc)
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  def new
    @post = PostsTag.new
  end

  def create
    @post = PostsTag.new(post_params)
    if @post.valid?
      @post.save
      redirect_to timeline_posts_path
      flash[:notice] = "投稿が保存されました"
    else
      render :new
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.user == current_user
      flash[:notice] = "投稿が削除されました" if @post.destroy
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
    redirect_to user_path(current_user.id)
  end

  private

  def post_params
    params.require(:posts_tag).permit(:text, :name, :image).merge(user_id: current_user.id)
  end
end
