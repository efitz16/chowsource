class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :ingredient_types, through: :ingredients, source: :ingredient_type
  has_many :measurements, through: :ingredients, source: :measurements
  has_many :food_preps, dependent: :destroy
  has_many :ingredients, through: :food_preps

  validates :title, :course, :directions, :description, :time, :difficulty, :user_id, presence: true
  validates :title, length: { maximum: 64 }
  validates :course, inclusion: { in: %w(Appetizer Breakfast Lunch Dinner Dessert Snack), message: "%{value} is not a valid course." }
  validates :directions, :description, length: { minimum: 12 }
  validates :time, :difficulty, numericality: true
  validates :difficulty, inclusion: { in: [1, 2, 3, 4, 5], message: "That is not a valid number." }

end
