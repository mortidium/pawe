class TagsController < ApplicationController
     before_action :require_editor, only: [:new, :edit]
  def index
    @tags=Tag.paginate(:page => params[:page], :per_page => 5).all
  end

  def show
    @tag=Tag.find(params[:id])
    @posts = @tag.posts.paginate(:page => params[:page], :per_page => 4)
  end


  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
      redirect_to '/tags', notice: "Usunięto opowiadanie!"
  end

  def new
    @tag = Tag.new
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag =Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
        redirect_to tag_path(@tag), notice: "Zmieniono opowiadanie."
    else
        render 'edit', alert: "Wystąpił błąd podczas zmiany opowiadania"
    end
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
        redirect_to '/tags', notice: "Utworzono opowiadanie!"
    else
        render 'new', alert: "Wystąpił błąd podczas tworzenia opowiadania"
    end

  end


  private

  def tag_params
      params.require(:tag).permit(:title, :image)
  end

end
