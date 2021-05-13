class NicesController < ApplicationController
  before_action :authenticate_user!

  def create
    @nice = current_user.nices.build(nice_params)
    @post = @nice.post
    if @nice.save
      respond_to :js
    end
  end

  def destroy
    @nice = Nice.find_by(id: params[:id])
    @post = @nice.post
    if @like.destroy
      respond_to :js
    end
  end

  private
    def nice_params
      params.permit(:post_id)
    end
end
