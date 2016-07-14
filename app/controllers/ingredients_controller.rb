class IngredientsController < ApplicationController
  before_action :get_ingredient, except:[:index, :new, :create]

  def index
    @ingredients = Recipe.find(params[:recipe_id]).ingredients
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    i = IngredientType.find_or_create_by(name: params[:ingredient][:ingredient_type])
    m = Measurement.find_or_create_by(name: params[:ingredient][:measurement])

    @ingredient = Ingredient.new(ingredient_type: i, amount: params[:ingredient][:amount].to_i, measurement: m)

    if @ingredient.save
      @recipe.ingredients << @ingredient
      redirect_to recipe_url(@recipe)
    else
      @errors = @ingredient.errors.full_messages
      render 'new'
    end
  end

  def edit

  end

  def update()
    @recipe = Recipe.find(params[:recipe_id])
    if @ingredient.update(ingredient_params)
      redirect_to recipe_path(@recipe)
  end

  def destroy

    @ingredient.destroy
    redirect_to '/'
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:ingredient_type, :amount, :measurement)
  end

  def get_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
