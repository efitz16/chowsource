class Ingredient < ActiveRecord::Base
  belongs_to :ingredient_type
  belongs_to :measurement
  has_many :food_preps
  has_many :recipes, through: :food_preps
end
