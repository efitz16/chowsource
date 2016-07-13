class UsersController < ApplicationController

  def index 
  end

  def show 
    @user = User.find(params[:id])
    @recipes = @user.recipes.all
  end

  def new 
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:succes] = "Get cooking! You've created a Chowsource Account!"
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
    params.require(:user).permit(:name, :email, :password)
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end
end
