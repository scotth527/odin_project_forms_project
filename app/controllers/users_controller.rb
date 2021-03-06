class UsersController < ApplicationController
    include UsersHelper

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
            flash.notice = "User Created!"
            redirect_to new_user_path
        else
            #flash.notice = "Please address user errors"
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)

            flash.notice = "User '#{@user.username}' Updated!"
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

end
