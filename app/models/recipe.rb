class Recipe < ApplicationRecord
  has_many :recipe_items, dependent: :delete_all
  has_many :recipe_methods, dependent: :delete_all
end
