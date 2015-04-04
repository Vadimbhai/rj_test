class TopController < ApplicationController
  def index
    count = params.has_key?(:count) ? params[:count] : 10

    @users = User.joins(:comments).group("users.id").order('COUNT(comments.id) DESC').limit(count)
  end
end
