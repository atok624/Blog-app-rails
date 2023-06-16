class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.post
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.post.find(params[:id])
    @comments = @post.comment
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

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
