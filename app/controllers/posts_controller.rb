class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/posts'
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post =Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to(:action => 'show', :id => @post.id)
    else
      render 'edit'
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
       redirect_to '/posts'
    else
      render 'new'
    end

  end


  private
    def post_params
      params.require(:post).permit(:title,:content)
    end
end
