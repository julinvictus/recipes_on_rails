class Recipe < ApplicationRecord
  # validates: recipe, length: {maximum: 100}, presence: true

  has_many :ingredient_recipes
  has_many :ingredients, :through => :ingredient_recipes

  after_save :maintain_ingredient_recipe_table

  def self.search(ingredient_id)
    ingredient_recipes = IngredientRecipe.joins(:ingredient).where(ingredient_id: ingredient_id)
    recipe_ids = ingredient_recipes.map { |i_r| i_r['recipe_id']}
    Recipe.find(recipe_ids)
  end

  def maintain_ingredient_recipe_table
    new_ingredient_recipe = IngredientRecipe.new(
      ingredient_id: ingredient.id,
      recipe_id: id,
    )
    new_ingredient_recipe.save!
  end
end
