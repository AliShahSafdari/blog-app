class PostsController < ApplicationController
  def index
    page = params[:page] || 1
    per_page = 10

    @posts = Post.includes(:author)
      .includes(:comments)
      .where(author: params[:user_id])
      .order(created_at: :asc)
      .offset((page.to_i - 1) * per_page)
      .limit(per_page)

    @total_pages = (current_user.posts.count.to_f / per_page).ceil
    @author = @posts.first.author unless @posts.first.nil?
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(current_user), notice: 'Post created successfully!'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.likes.destroy_all
    @post.comments.destroy_all
    if @post.destroy
      redirect_to user_posts_path(current_user), notice: 'Post deleted successfully'
    else
      flash.new[:alert] = @post.errors.full_messages.first if @post.errors.any?
      render :show, status: 400
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
