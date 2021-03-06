class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def index
     @users = User.all
    end

    def show
     @user = User.find(params[:id])
    end   

    def new
    @user = User.new
    end

    def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/users'
    else
      render_to '/users/new'
    end 
    end

  def destroy
    @user.destroy
    redirect_to '/users'
  end

   def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      redirect_back fallback_location: edit_user_path(@user)
    end
  end

    def user_params
    params.require(:user).permit(:name, :email)
   end

    def set_user
    @user = User.find(params[:id])
    end
end

