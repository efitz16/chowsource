class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references :ingredient_type, index: true, foreign_key: true
      t.integer :amount
      t.references :measurement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
