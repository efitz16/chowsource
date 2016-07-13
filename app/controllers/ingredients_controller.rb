class IngredientsController < ApplicationController
  before_action :get_ingredient, except:[:index, :new, :create]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    
  end



  private
  def ingredient_params
    params.require(:ingredient).permit(:ingredient_type, :amount, :measurement)
  end
end
