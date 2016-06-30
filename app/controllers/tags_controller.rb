class TagsController < ApplicationController
    before_action :require_editor, only: [:new, :edit]
    expose :one_tag, model: Tag
    expose :tag_list, -> {Tag.paginate(:page => params[:page], :per_page => 5).all}
    expose :posts, -> {one_tag.posts.paginate(:page => params[:page], :per_page => 3)}

  def destroy
      one_tag.destroy
    redirect_to '/tags', notice: "Usunięto opowiadanie!"
  end

  def update
      if one_tag.update_attributes(tag_params)
          redirect_to tag_path(one_tag), notice: "Zmieniono opowiadanie."
    else
        render 'edit', alert: "Wystąpił błąd podczas zmiany opowiadania"
    end
  end

  def create
      if one_tag.save
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
