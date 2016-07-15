class SearchesController < ApplicationController
  def index
  	# puts 'hi'
	# @searchable_shit = IngredientType.where(name: params[:search])
	@searchable_shit = IngredientType.search_by_ingredient(params[:search])

	render 'results'
  end
end
