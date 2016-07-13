class IngredientsController < ApplicationController
  before_action :get_ingredient, except:[:index, :new, :create]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    i = IngredientType.find_or_create_by(params[:ingredient][:ingredient_type])
    m = Measurement.find_or_create_by(params[:ingredient][:measurement])
    @ingredient = Ingredient.new(ingredient_type: i, amount: params[:ingredient][:amount].to_i, measurement: m)

    if @ingredient.save
      redirect_to ingredient_url(@ingredient)
    else
      @errors = @ingredient.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to '/'
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:ingredient_type, :amount, :measurement)
  end
end
