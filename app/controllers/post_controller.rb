class PostController < ApplicationController
  def index
    @comment = Comment.new
  end

end
