class CreateFoodPreps < ActiveRecord::Migration
  def change
    create_table :food_preps do |t|
      t.references :ingredient, index: true, foreign_key: true
      t.references :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
