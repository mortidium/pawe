class LiketagsController < ApplicationController
    
  def index
        @liketags = Liketag.all
  end
    
  def show
      @liketag = Liketag.find(params[:tag_id,:ip])
  end

  def new
      @liketag = Liketag.new
  end

  def create
      @liketag = Liketag.new(liketag_params)
    if @liketag.save
        redirect_to tag_path(liketag_params[:tag_id]), notice: "Dzięki!"
    else
        redirect_to :back, alert: "Coś nie pykło"
    end
  end

  private
    def liketag_params
        params.require(:liketag).permit(:tag_id).merge(:ip => request.remote_ip)
  end

end
