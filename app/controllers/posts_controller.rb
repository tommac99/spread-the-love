class PostsController < ApplicationController
 def home
  @posts = Post.all
 end

 def index
 end

 def new
 end

 def create
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


