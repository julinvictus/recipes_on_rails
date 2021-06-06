class Recipe < ApplicationRecord
    validates: recipe, length: {maximum: 100}, presence: true

    has_many :ingredient_recipes
    has_many :ingredients, through :ingredient_recipes
end
