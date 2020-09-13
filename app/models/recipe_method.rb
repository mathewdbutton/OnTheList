class RecipeMethod < ApplicationRecord
  belongs_to :recipe
  has_many :method_recipe_items
end
