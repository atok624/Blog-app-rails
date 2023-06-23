class PostsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :post, through: :user, shallow: true
  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_posts_path(current_user)

    else
      flash[:alert] = 'Something went wrong'
      render 'new'
    end
  end

  def new
    @post = Post.new
  end

  def include_user
    @posts = @user.posts.includes(:comments)
  end

  def destroy
    @post.destroy
    @post.likes.destroy_all
    redirect_to user_posts_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
