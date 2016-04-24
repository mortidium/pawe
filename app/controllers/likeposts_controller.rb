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
        redirect_to post_path(@post), notice: "Dzięki!"
    else
        redirect_to :back, alert: "Coś nie pykło"
    end
  end

  private
    def likepost_params
        params.require(:likepost).permit(:post,:ip => request.remote_ip)
  end
end