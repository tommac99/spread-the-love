class PostsController < ApplicationController
 def index
  @posts = Post.all
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
  if @post.update_attributes(permitted_attributes(@post))
    redirect_to @post
  else
    render :edit
  end
end

end


