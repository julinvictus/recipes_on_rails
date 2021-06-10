# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ingredients = Ingredient.create([
  { ingredient: 'cauliflower'},
  { ingredient: 'chia seeds'},
  { ingredient: 'cashews'},
  { ingredient: 'tofu'},
  { ingredient: 'mushrooms'},  
])

ingredients = Recipe.create([
  { name: 'Cauliflower Mac and Cheese', recipe_url:'https://nyssaskitchen.com/easy-dairy-free-cauliflower-mac-and-cheese-vegan-paleo/'},
  { name: 'Chia Pudding', recipe_url:'https://www.gnom-gnom.com/overnight-keto-chia-pudding/'},
  { name: 'Marinated Tofu', recipe_url:'https://www.noracooks.com/marinated-tofu/'},
  { name: 'Shiitake Mushroom Fried Rice', recipe_url:'https://www.staceyhomemaker.com/30-minute-ginger-cauliflower-fried-rice/'},  
])