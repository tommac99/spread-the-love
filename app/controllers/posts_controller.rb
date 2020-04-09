class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized, except: :index

  def index
    @posts = Post.all
    authorize @posts
  end

  def new
    # @post = Post.new
    @post = Post.new
    authorize @post
  end

  def show
    authorize @post
  end

  def create

    @post = current_user.posts.create(post_params)
    @post.user_name = current_user.name
    # @post.user_id = current_user.id

    if @post.save!
      authorize @post
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      authorize @post
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
   @post.destroy
   redirect_to root_path
  end

  def dashboard
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: @user.id)
    authorize @posts
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :description, :category, :location, :group,:date,:user_name)
  end

end

