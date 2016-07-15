class RecipesController < ApplicationController
  before_action :current_user, :only => [:show, :index]
  def index
    if logged_in?
      @recipe = @current_user.recipes.build
    end
    @appetizers = Recipe.where(course: "Appetizer")
    @breakfasts = Recipe.where(course: "Breakfast")
    @lunches = Recipe.where(course: "Lunch")
    @dinners = Recipe.where(course: "Dinner")
    @desserts = Recipe.where(course: "Dessert")
    @snacks = Recipe.where(course: "Snack")
  end

  def top10
    @top_recipes = Recipe.sort_by_rating.first(10)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe == nil
      redirect_to recipes_url
    end
  end

  def new
    login_redirect
    @recipe = Recipe.new
  end

  def edit
    login_redirect
    @recipe = Recipe.find(params[:id])
    # if current_user != @recipe.user
    #   redirect_to recipe_url(@recipe)
    # end
    redirect_to recipe_url(@recipe) unless current_user == @recipe.user
  end

  def create
    if logged_in?
      @recipe = current_user.recipes.build(recipe_params)
      if @recipe.save
        redirect_to new_recipe_ingredient_url(@recipe)
      else
        render 'new'
      end
    else
      redirect_to login_url
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if current_user == @recipe.user
      if @recipe.update(recipe_params)
        redirect_to recipe_url(@recipe)
      else
        render 'edit'
      end
    else
      redirect_to recipe_url(@recipe)
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if current_user == @recipe.user
      @recipe.destroy
      redirect_to user_url(current_user)
    else
      # This needs to raise an error, but not sure how to implement
      redirect_to recipe_url(@recipe)
      # flash.now[:error] = "You do not have permission to delete this recipe."
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :course, :directions, :description, :time, :difficulty)
    end
end
