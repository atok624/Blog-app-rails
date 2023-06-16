class LikesController < ApplicationController
  def create
    @like = current_user.like.new
    @like.post_id = params[:post_id]
    @like.save
    flash[:success] = 'Liked sucessfully!'
    redirect_to "/users/#{current_user.id}/posts"
  end
end
