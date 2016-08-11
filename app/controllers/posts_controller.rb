class PostsController < ApplicationController
  before_action :require_editor, only: [:new, :edit]
    expose :post
    expose :tags_select, ->{Tag.all}
    expose :posts_select, ->{Post.order(created_at: :desc).all}
    expose :posts, -> {Post.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6).all}

  def destroy
    post.destroy
    redirect_to '/posts', notice: "Usunięto rozdział!"
  end

  def update
    if post.update_attributes(post_params)
        redirect_to post_path(post), notice: "Zmieniono rozdział!"
    else
        render 'edit'
    end
  end

  def create
    if post.save
        redirect_to post_path(post), notice: "Dodano rozdział!"
    else
        render 'new'
    end
  end


  private
  def post_params
    params.require(:post).permit(:image, :image_file_name, :title, :content, :tag_id)
  end

end
