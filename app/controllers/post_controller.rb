class PostController < ApplicationController
  def index
    @comment = Comment.new
  end

  def create
    user = User.find_by(name: params[:user_name])
    if user == nil
      user = User.new(name: params[:user_name])
      user.save
    end

    comment = user.comments.build(content: params[:content])

    respond_to do |format|
      if comment.save
        format.html { redirect_to user, notice: 'Comment added' }
        format.json { render action 'show', status: created, location: comment }
      else
        format.html { render action: 'new' }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
