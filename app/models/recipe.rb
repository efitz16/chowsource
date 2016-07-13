class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :ingredient_types, through: :ingredients, source: :ingredient_type
  has_many :measurements, through: :ingredients, source: :measurements
end
