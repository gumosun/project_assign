class UsersController < ApplicationController
    def index
     @users = User.all
    end

    def show
     @user = User.find(params[:id])
    end   

    # def create
    # user = params['user']
    # User.create(name: user['name'],
    #             email: user['email'])
    # redirect_to("/users")            
    # end

    # def destroy
    # User.destroy(params['id'])
    # redirect_to("/users")
    # end

    # def update
    # user = params['user']   
    # User.update(name: user['name'],
    #             email: user['email'])
    # redirect_to("/user")  
    # end
end

