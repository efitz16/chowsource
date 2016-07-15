class Ingredient < ActiveRecord::Base
  belongs_to :ingredient_type
  belongs_to :measurement
  has_many :food_preps, dependent: :destroy
  has_many :recipes, through: :food_preps

  validate :check_blank

  def check_blank
    if ingredient_type.name.length == 0
      errors.add(:ingredient_type, "can't be blank")
    end
  end

  def name
    self.ingredient_type.name
  end

  def meas
    self.measurement.name
  end
end
