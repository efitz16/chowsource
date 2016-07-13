class UsersController < ApplicationController

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

  def update 
  end

  def destroy 
  end

  private 

  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end
end
