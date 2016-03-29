class PostsController < ApplicationController
  include  ActionView::Helpers::SanitizeHelper

    before_action :require_editor, only: [:new, :edit]
    
  def index
    @posts = Post.order(created_at: :desc).all
  end

  def show
    @post = Post.find(params[:id])
    @content = strippedtags(@post.content)
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
 params.require(:post).permit(:image,:image_file_name,:title,:content)
    end

    def strippedtags(content)
      tags = %w(a acronym b strong i em li ul ol h1 h2 h3 h4 h5 h6 blockquote u img br cite sub sup ins p)
      sanitize(content, tags: tags, attributes: %w(href title))
    end
end
