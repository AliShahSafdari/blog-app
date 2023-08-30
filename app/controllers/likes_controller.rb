class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.author = current_user
    @like.post = Post.find(params[:post_id])
    @like.save
    redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
  end

  def destroy
    @like = current_user.likes.find(params[:user_id])
    @like.destroy
    redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
  end
end
