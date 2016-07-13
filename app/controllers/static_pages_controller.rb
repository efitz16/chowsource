class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @recipe = current_user.recipes.build

      @recipes = Recipe.where(user: current_user)
    end
  end

  def about

  end
end
