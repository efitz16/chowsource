class SearchesController < ApplicationController
  def index
	@recipes_by_ingredient = IngredientType.search_by_ingredient(params[:search]).take(10)

  @recipes_by_description = Recipe.search_by_description(params[:search]).take(10)

  @recipes_by_title = Recipe.search_by_title(params[:search]).take(10)

	render 'results'
  end

  def show
    case params[:id]
    when "1"
      @ingredients = IngredientType.search_by_ingredient(params[:search])
    when "2"
      @recipes = Recipe.search_by_description(params[:search])
    when "3"
      @recipes = Recipe.search_by_title(params[:search])
    end

    render 'searches/index'

  end
end
