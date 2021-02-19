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
# Cocktail.create(name: "High Ball", photo: 'https://d2e111jq13me73.cloudfront.net/sites/default/files/styles/share_link_image_large/public/screenshots/csm-movie/the-hangover-1.jpg?itok=ZFUDMfZE')
# Cocktail.create(name: "Screw Driver", photo: 'https://pbs.twimg.com/media/EjQxS-wX0AI5-qC.jpg')
# Cocktail.create(name: "Catalina Wine Mixer", photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoBPfh9jcpyXViCec05-w-k_y4XwCsXQ6HJQ&usqp=CAU')
# Cocktail.create(name: "Brain tumor", photo: 'https://hips.hearstapps.com/esquireuk.cdnds.net/17/20/768x575/gallery-original-hangover-cures-1-43-jpg-71375bbf.jpg?resize=480:*')
# Cocktail.create(name: "Some chick drink", photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFGyiR4LeRMGJW68XbWYnaHqmUSsta2W76Gg&usqp=CAU')