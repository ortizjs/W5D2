class PostsController < ApplicationController
  
  def new 
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end 
  
  def create 
    @post = Post.new(post_params)
    @post.author_id = current_user.id
        
    if @post.save 
      redirect_to sub_url(@post.sub_id) 
    else 
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def update 
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else 
      flash[:errors] = @post.errors.full_messages
    end 
  end
  
  def edit 
    @post = Post.find(params[:id])
  end
  
  def destroy 
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.link)
  end
  
  private 
  def post_params 
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end
end
