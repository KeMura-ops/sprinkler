class NicesController < ApplicationController
  before_action :nice_params
  before_action :authenticate_user!

  def create
    Nice.create(user_id: current_user.id, post_id: params[:id])
  end

  def destroy
    Nice.find_by(user_id: current_user.id, post_id: params[:id]).destroy
  end

  private

  def nice_params
    @post = Post.find(params[:id])
  end
end
