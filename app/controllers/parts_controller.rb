class PartsController < ApplicationController
  def index
    @parts = Part.all
  end

  def new
    @part = Part.new
  end

  def edit
    @part = Part.find(params[:id])
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
      redirect_to '/parts'
    else
      render 'new'
    end

  end

  private
  def part_params
    params.require(:part).permit(:post, :tag)
  end
end
