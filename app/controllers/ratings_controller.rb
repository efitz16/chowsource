class RatingsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    binding.pry
    if logged_in?
      @rating = Rating.new(recipe: @recipe, user: current_user, value: params[:value].to_i)

      @rating.save
    end

    redirect_to recipe_path(@recipe)
  end
end
