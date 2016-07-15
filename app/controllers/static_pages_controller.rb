class StaticPagesController < ApplicationController
  # include ApplicationHelper
  def home
    if params[:search]
      redirect_to searches_path(search: params[:search])
    else
      if logged_in?
        current_user
        @recipe = current_user.recipes.build

        @recipes = current_user.recipes
      end
    end
  end

  def about

  end
end
