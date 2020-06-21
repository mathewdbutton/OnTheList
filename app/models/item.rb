class Item < ApplicationRecord
  has_many :list_items, dependent: :delete_all, inverse_of: :item
end
