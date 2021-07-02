class Recipe < ApplicationRecord
  # validates: recipe, length: {maximum: 100}, presence: true

  has_many :ingredient_recipes
  has_many :ingredients, :through => :ingredient_recipes

  def self.search(ingredient_id)
    ingredient_recipes = IngredientRecipe.joins(:ingredient).where(ingredient_id: ingredient_id)
    recipe_ids = ingredient_recipes.map { |i_r| i_r['recipe_id']}
    Recipe.find(recipe_ids)
  end
end
