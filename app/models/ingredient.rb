class Ingredient < ActiveRecord::Base
  belongs_to :ingredient_type
  belongs_to :measurement
end
