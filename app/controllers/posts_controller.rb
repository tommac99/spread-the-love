class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @posts = policy_scope(Post).all
  end

  def new
    # @post = Post.new
    @post = current_user.posts.new
    authorize @post
  end

  def show
  end

  def create
    @post = current_user.posts.create(post_params)
    # @post.user_id = current_user.id

    if @post.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
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


