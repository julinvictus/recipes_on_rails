class Recipe < ApplicationRecord
  # validates: recipe, length: {maximum: 100}, presence: true

  has_many :ingredient_recipes
  # has_many :ingredients, through :ingredient_recipes

  after_save :maintain_ingredient_recipe_table

  def self.search(search)
    if search
      ingredient = Ingredient.find_by(ingredient: search)
      if ingredient
        IngredientRecipe.where(ingredient_id: ingredient)
      end
    end
  end

  def maintain_ingredient_recipe_table
    new_ingredient_recipe = IngredientRecipe.new(
      ingredient_id: ingredient.id,
      recipe_id: id,
    )
    new_ingredient_recipe.save!
  end
end
