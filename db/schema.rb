# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160713153027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_preps", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "food_preps", ["ingredient_id"], name: "index_food_preps_on_ingredient_id", using: :btree
  add_index "food_preps", ["recipe_id"], name: "index_food_preps_on_recipe_id", using: :btree

  create_table "ingredient_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer  "ingredient_type_id"
    t.integer  "amount"
    t.integer  "measurement_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "ingredients", ["ingredient_type_id"], name: "index_ingredients_on_ingredient_type_id", using: :btree
  add_index "ingredients", ["measurement_id"], name: "index_ingredients_on_measurement_id", using: :btree

  create_table "measurements", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.string   "course"
    t.text     "directions"
    t.text     "description"
    t.integer  "time"
    t.integer  "difficulty"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "food_preps", "ingredients"
  add_foreign_key "food_preps", "recipes"
  add_foreign_key "ingredients", "ingredient_types"
  add_foreign_key "ingredients", "measurements"
  add_foreign_key "recipes", "users"
end
