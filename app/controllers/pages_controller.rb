class PagesController < ApplicationController
  def index
  end

  def search
    @posts = Post.includes(:tags).search(params[:keyword]).order(created_at: :desc)
  end
end
