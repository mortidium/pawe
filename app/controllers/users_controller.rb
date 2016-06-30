class UsersController < ApplicationController
    before_action :require_editor, only: [:index]

    
  def index
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true)
  end
    
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

    def edit
        @user=User.find(params[:id])    
    end
    
    def update
        @user=User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to users_path
        else
            render 'edit'
        end
    end

    

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end


end
