class RatingsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    if logged_in?
      @rating = Rating.new(recipe: @recipe, user: current_user, value: params[:value].to_i + 1)

      @rating.save
    end

    redirect_to recipe_path(@recipe)
  end
end
