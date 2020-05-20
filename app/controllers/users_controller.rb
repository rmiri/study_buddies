class UsersController < ApplicationController
    
    before_action :require_login
    skip_before_action :require_login, only: [:welcome, :new, :create] 


    def welcome
    end

    def new 
        @user = User.new
    end 

    def show 
        @users = User.all 
    end 

    def mygroups
        @created_study_groups = current_user.created_study_groups 
        @joined_study_groups = current_user.study_groups
    end

    def create
        @user = User.create(user_params)
        # debugger
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to study_groups_path 
        else 
            flash[:errors] = @user.errors.full_messages
            render 'new' 
        end 
    end 
    
    def edit 
        @user = User.find(params[:id])
    end 

    def update 

        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.valid?
            redirect_to user_path(@user) 
        else 
            render 'edit'  
        end 
    end

    def destroy
        @user = User.find(params[:id])
        @user.delete
        session[:user_id] = nil
        redirect_to '/'
    end
    

    private 

    def user_params 
        # debugger
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end 
    

end
