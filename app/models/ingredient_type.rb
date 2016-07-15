class IngredientType < ActiveRecord::Base
  has_many :ingredients
  has_many :recipes, through: :ingredients, source: :recipes

  def self.search_by_ingredient(text)
    regexp = /#{text}/i;

    result = self.all.order(:name).where("name ILIKE ?", "%#{text}%").limit(10)

    results = result.sort{|x, y| (x =~ regexp) <=> (y =~ regexp) }

    results.map { |r| r.recipes }
  end


end
