# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

users = [User.create(username: "hello", email: "hell@hello.com", password: "Password1"), User.create(username: "aciacci1234", email: "aciacci@ciacci.com", password: "Password1"), User.create(username: "joell", email: "joell@joell.com", password: "Password1"), User.create(username: "jeffey", email: "jeffey-l@jeff.com", password: "Password1")]

IngredientType.create(name: "flour")

types = %w(flour butter milk eggs chicken rabbit jeff beef carrots corn oranges apples pears honey tea pepper salt tofu)

Measurement.create(name: "cup")

measurements = %w(tablespoon teaspoon stick ounce pound gram pint quart gallon slice)

Recipe.create(title: "bread", course: "Lunch", directions: "shake it and bake it, duh", description: "warm and deliciously delicious", time: 60, difficulty: 3, user: User.find_by(username: "hello"))

courses = %w(Appetizer Breakfast Lunch Dinner Dessert Snack)

Ingredient.create(ingredient_type: IngredientType.find_by(name: "flour"), measurement: Measurement.find_by(name: "cup"), amount: 3)

FoodPrep.create(ingredient: Ingredient.find_by(amount: 3), recipe: Recipe.find_by(title: "bread"))

types.each do |t|
  IngredientType.create(name: t)
end

ingredientz = []

25.times do
   ingredientz << IngredientType.all.sample
end

measurements.each do |m|
  Measurement.create(name: m)
end

measurementz = []

25.times do
   measurementz << Measurement.all.sample
end

56.times do
  Recipe.create(title: Faker::Beer.name, course: courses.sample, directions: Faker::Hipster.sentences.join(' '), description: Faker::Lorem.sentence, time: rand(1..100), difficulty: rand(1..5), user: users.sample)
end

16.times do
  Recipe.create(title: "Tofu " + Faker::Beer.name, course: courses.sample, directions: Faker::Hipster.sentences.join(' '), description: "Tofuncular " + Faker::Lorem.sentence, time: rand(1..100), difficulty: rand(1..5), user: users.sample)
end

6.times do
  Recipe.create(title: "Tofrutti " + Faker::Beer.name, course: courses.sample, directions: Faker::Hipster.sentences.join(' '), description: "Tofu tofunny " + Faker::Lorem.sentence, time: rand(1..100), difficulty: rand(1..5), user: users.sample)
end

les_ingredients = []

46.times do
  les_ingredients << Ingredient.create(ingredient_type: ingredientz.sample, measurement: measurementz.sample, amount: rand(1..10))
end

56.times do
  FoodPrep.create(ingredient: les_ingredients.sample, recipe: Recipe.all.sample)
end

857.times do
	Rating.create(user: users.sample, recipe: Recipe.all.sample, value: rand(1..5))
end

# can this be cleaned up: Recipe.find(59).ingredients.first.ingredient_type.name
