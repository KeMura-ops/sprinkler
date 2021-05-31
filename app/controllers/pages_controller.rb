class PagesController < ApplicationController
  def index
  end

  def search
    @posts = Post.search(params[:keyword])
  end

end
