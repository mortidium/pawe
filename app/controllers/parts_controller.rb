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

  def edit
    @part = Part.find(params[:id])
  end
    
    def destroy
    @part = Part.find(params[:id])
    @part.destroy
    redirect_to(:action => 'index')
  end

  def update
    @part =Part.find(params[:id])
    if @part.update_attributes(part_params)
      redirect_to(:action => 'index', :id => @part.id)
    else
      render 'edit'
    end
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to '/tags'
    else
      render 'new'
    end

  end

  private
  def part_params
    params.require(:part).permit(:post_id, :tag_id)
  end
end
