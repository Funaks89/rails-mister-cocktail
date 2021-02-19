# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
puts 'destroying'
Ingredient.destroy_all
Cocktail.destroy_all
puts 'destroyed'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

user['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
  puts "ingredient created"
end


# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
Cocktail.create(name: "High Ball")
Cocktail.create(name: "Screw Driver")
Cocktail.create(name: "Catalina Wine Mixer")
Cocktail.create(name: "Brain tumor")
Cocktail.create(name: "Some chick drink")