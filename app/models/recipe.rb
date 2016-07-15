class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :ingredient_types, through: :ingredients, source: :ingredient_type
  has_many :measurements, through: :ingredients, source: :measurements
  has_many :food_preps, dependent: :destroy
  has_many :ingredients, through: :food_preps
  has_many :ratings, dependent: :destroy

  validates :title, :course, :directions, :description, :time, :difficulty, :user_id, presence: true
  validates :title, length: { maximum: 64 }
  validates :course, inclusion: { in: %w(Appetizer Breakfast Lunch Dinner Dessert Snack), message: "%{value} is not a valid course." }
  validates :directions, :description, length: { minimum: 12 }
  validates :time, :difficulty, numericality: true
  validates :difficulty, inclusion: { in: [1, 2, 3, 4, 5] }

  validates :course,  uniqueness: { scope: [:user, :course], message: "only 1 recipe per course per user allowed" }

  def average_rating
    length = self.ratings.count

    if length == 0
      # self.ratings.map {|rating| rating.value}.reduce(0, :+)
      0
    else
      self.ratings.map {|rating| rating.value}.reduce(0, :+)/length
    end
  end

  def self.sort_by_rating
     self.all.sort_by { |r| r.true_rating }.reverse
  end

  def true_rating
    number_of_votes = Recipe.all.map { |r| r.ratings.count }.reduce(0, :+)
    weight = self.ratings.count/number_of_votes.to_f

    self.ratings.map { |r| r.value * weight }.reduce(0, :+)
  end

  def self.search_by_description(text)
    regexp = /#{text}/i;

    result = self.all.order(:description).where("description ILIKE ?", "%#{text}%").limit(1000)

    results = result.sort{|x, y| (x =~ regexp) <=> (y =~ regexp) }
  end

  def self.search_by_title(text)
    regexp = /#{text}/i;

    result = self.all.order(:title).where("title ILIKE ?", "%#{text}%").limit(1000)

    results = result.sort{|x, y| (x =~ regexp) <=> (y =~ regexp) }
  end
end
