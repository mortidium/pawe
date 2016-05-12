class LikepostsController < ApplicationController
    
    def index
        @likeposts = Likepost.all
  end
    
  def show
      @likepost = Likepost.find(params[:post,:ip])
  end

  def new
      @likepost = Likepost.new
  end

  def create
      @likepost = Likepost.new(likepost_params)
    if @likepost.save
        redirect_to :back, notice: "Dzięki!"
    else
        redirect_to :back, alert: "Coś nie pykło"
    end
  end

  private
    def likepost_params
        params.require(:likepost).permit(:post_id).merge(:ip => request.remote_ip)
  end
end