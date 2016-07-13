# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

users = [User.create(username: "hello", email: "h@h.com", password_digest: "Password1"), User.create(username: "ciacci1234", email: "ciacci@ciacci.com", password_digest: "Password1"), User.create(username: "joell", email: "joell@joell.com", password_digest: "Password1"), User.create(username: "jeff", email: "jeff-l@jeff.com", password_digest: "Password1")]

IngredientType.create(name: "flour")

types = %w(flour butter milk eggs chicken rabbit jeff beef carrots corn oranges apples pears honey tea pepper salt)

Measurement.create(name: "cup")

measurements = %w(cup tablespoon teaspoon stick ounce pound gram pint quart gallon slice)

Recipe.create(title: "bread", course: "lunch", directions: "bake it, duh", description: "warm and delicious", time: 60, difficulty: 3, user: User.find_by(username: "hello"))

courses = %w(breakfast lunch dinner dessert)

Ingredient.create(ingredient_type: IngredientType.find_by(name: "flour"), measurement: Measurement.find_by(name: "cup"), amount: 3)

FoodPrep.create(ingredient: Ingredient.find_by(amount: 3), recipe: Recipe.find_by(title: "bread"))


ingredientz = []

25.times do
   ingredientz << IngredientType.create(name: types.sample)
end

measurementz = []

25.times do
   measurementz << Measurement.create(name: measurements.sample)
end

56.times do
  Recipe.create(title: Faker::Beer.name, course: courses.sample, directions: Faker::Hipster.sentences, description: Faker::Lorem.sentence, time: rand(1..100), difficulty: rand(1..5), user: users.sample)
end

les_ingredients = []

46.times do
  les_ingredients << Ingredient.create(ingredient_type: ingredientz.sample, measurement: measurementz.sample, amount: rand(1..10))
end

56.times do
  FoodPrep.create(ingredient: les_ingredients.sample, recipe: Recipe.all.sample)
end

# can this be cleaned up: Recipe.find(59).ingredients.first.ingredient_type.name


