require 'open-uri'
require 'json'

puts "cleaning database"
Ingredient.destroy_all

puts "creating ingredient from JSON file"

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized_ingredients = open(url).read

ingredients = JSON.parse(serialized_ingredients)

ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

puts "Seeds of ingredients are done"
