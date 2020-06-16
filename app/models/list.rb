class List < ApplicationRecord
  has_many :list_items, dependent: :delete_all, inverse_of: :list
  has_many :items, through: :list_items
end
