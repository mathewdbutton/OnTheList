class RecipeItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :item

  has_many :method_recipe_items, dependent: :delete_all

  accepts_nested_attributes_for :item
end
