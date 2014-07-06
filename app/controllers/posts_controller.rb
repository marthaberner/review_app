class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    user = User.find_by(params[:id])

    if @post.save
      redirect_to user_path(user)
    else
      flash.now[:notice]
      render user_path(user)
    end
  end

  def new
    @post = Post.new
  end

  def show
    @posts = Post.all
  end

  def destroy
    user = User.find(session[:id])
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_path(user)
  end

  def post_params
    params.require(:post).permit(:body)
  end
end