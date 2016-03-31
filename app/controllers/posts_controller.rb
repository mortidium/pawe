class PostsController < ApplicationController
  before_action :require_editor, only: [:new, :edit]

  def index
    @posts = Post.order(created_at: :desc).all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.image.destroy
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
        redirect_to '/parts/new'
    else
      render 'edit'
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
        redirect_to post_path(@post)
    else
      render 'new'
    end

  end


  private
  def post_params
    params.require(:post).permit(:image, :image_file_name, :title, :content)
  end
    
end
