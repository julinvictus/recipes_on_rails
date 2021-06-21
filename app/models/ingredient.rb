class Ingredient < ApplicationRecord
    validates :ingredient, length: {maximum: 50}, presence: true

    has_many :ingredient_recipes
    has_many :recipes, :through => :ingredient_recipes
end
