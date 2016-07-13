class IngredientType < ActiveRecord::Base
  has_many :ingredients
  has_many :recipes, through: :ingredients, source: :recipes
end
