class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @recipe = current_user.recipes.build

      @recipes = current_user.recipes
    end
  end

  def about

  end
end
