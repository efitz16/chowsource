class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new(ingredient_params)
  end

  private
  # ingredient_params
end
