class UsersController < ApplicationController
    before_action :require_editor, only: [:index]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

   

  def index
      @users = User.all
      
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end


end
