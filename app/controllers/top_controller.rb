class TopController < ApplicationController
  def index
    @users = User.joins(:comments).group("users.id").order('COUNT(comments.id) DESC').limit(10)
  end
end
