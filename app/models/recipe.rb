class Recipe < ApplicationRecord
  # validates: recipe, length: {maximum: 100}, presence: true

  has_many :ingredient_recipes
  # has_many :ingredients, through :ingredient_recipes

  # after_save :maintain_ingredient_recipe_table

  # def maintain_ingredient_recipe_table
  #   previous_ingredient_ids = ingredient_recipes.all.map(&:ingredients)
  #   current_ingredient_ids = ingredients.map()

  # end
end
