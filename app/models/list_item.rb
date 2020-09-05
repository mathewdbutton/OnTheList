class ListItem < ApplicationRecord
  belongs_to :list
  belongs_to :item, inverse_of: :list_items

  accepts_nested_attributes_for :item
end
