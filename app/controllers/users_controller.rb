class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]

  def index 
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])
    @recipes = @user.recipes.all
  end

  def new 
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Get cooking! You've created a Chowsource Account!"
      log_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit 
    @user = User.find(params[:id])
    if !current_user?
    flash[:danger]= "Hey! Edit your own profile, please!"
    end
  end

  def update 
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @current_user.destroy
    redirect_to root_url 
  end

  

  private 

  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?
  end
end
