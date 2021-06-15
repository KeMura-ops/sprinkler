class NicesController < ApplicationController
  before_action :nice_params
  before_action :authenticate_user!

  def index
    @posts = Post.includes(:tags, :nices).joins(:nices).where(nices: { user_id: params[:user_id] }).order(created_at: :desc)
  end

  def create
    Nice.create(user_id: current_user.id, post_id: params[:id])
  end

  def destroy
    Nice.find_by(user_id: current_user.id, post_id: params[:id]).destroy
  end

  private

  def nice_params
    @post = Post.find_by(id: params[:id])
  end
end
