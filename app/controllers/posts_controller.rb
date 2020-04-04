class PostsController < ApplicationController
 def home
    @posts = Post.all
  end

  def index
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_param)
    @post.user_id = current_user.id

    if @post.save!
      redirect_to root_path
    else
      render :new
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_param)
      redirect_to post_path(@post.id)
    else
    render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def post_param
    params.require(:post).permit(:title, :description, :category,:location, :group,:date)
  end
end