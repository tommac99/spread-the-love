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
    @post = current_user.posts.new
    authorize @post
  end

  def show
    authorize @post
  end

  def create
    @post = current_user.posts.create(post_params)
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

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :description, :category, :location, :group,:date)
  end

end


