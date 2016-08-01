class PartsController < ApplicationController

    before_action :require_editor, only: [:new, :edit, :show, :index]

  def index
    @parts = Part.order(created_at: :desc).all
  end

    def tags
        @tags = Part.tag.all
    end

  def new
    @part = Part.new
  end

    def like
        @part = Part.liketag.new
    end

  def edit
    @part = Part.find(params[:id])
  end

    def destroy
    @part = Part.find(params[:id])
    @part.destroy
        redirect_to '/tags', notice: "Usunięto."
  end

  def update
    @part =Part.find(params[:id])
    if @part.update_attributes(part_params)
        redirect_to '/parts', notice: "Zmieniono."
    else
        render 'edit', alert: "Nie udało się zmienić."
    end
  end

  def create
    @part = Part.new(part_params)
    if @part.save
        redirect_to post_path(@part.post_id), notice: "Przypisano rozdział do opowiadania!"
    else
        render 'new', alert: "Nie udało się przypisać rozdziału do opowiadania."
    end

  end

  private
  def part_params
    params.require(:part).permit(:post_id, :tag_id)
  end
end
