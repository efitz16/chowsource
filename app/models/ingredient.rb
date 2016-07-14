class Ingredient < ActiveRecord::Base
  belongs_to :ingredient_type
  belongs_to :measurement
  has_many :food_preps, dependent: :destroy
  has_many :recipes, through: :food_preps

  def name
    self.ingredient_type.name
  end

  def meas
    self.measurement.name
  end
end
