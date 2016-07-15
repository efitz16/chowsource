class SearchesController < ApplicationController
  def index
  	# puts 'hi'
	# @searchable_shit = IngredientType.where(name: params[:search])
	@recipes_by_ingredient = IngredientType.search_by_ingredient(params[:search])

  @recipes_by_description = Recipe.search_by_description(params[:search])

  @recipes_by_title = Recipe.search_by_title(params[:search])

	render 'results'
  end
end
