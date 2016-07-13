class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :course
      t.text :directions
      t.text :description
      t.integer :time
      t.integer :difficulty
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
