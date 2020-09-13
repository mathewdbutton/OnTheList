class ModelRecipeItem < ApplicationRecord
  belongs_to :recipe_method
  belongs_to :recipe_item
end
