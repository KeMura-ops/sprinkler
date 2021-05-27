class NicesController < ApplicationController
  before_action :authenticate_user!

  def create
    Nice.create(user_id: current_user.id, post_id: params[:id])
    redirect_to timeline_posts_path
  end

  def destroy
    Nice.find_by(user_id: current_user.id, post_id: params[:id]).destroy
    redirect_to timeline_posts_path
  end

  private
    def nice_params
      params.permit(:post_id)
    end
end
