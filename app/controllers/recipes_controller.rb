class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = user.recipe.build(recipe_params)

    if @recipe.save

    else

    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :course, :directions, :description, :time, :difficulty)
    end
end
