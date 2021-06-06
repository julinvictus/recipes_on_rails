class Ingredient < ApplicationRecord
    validates :ingredient, length: {maximum: 50}
end
