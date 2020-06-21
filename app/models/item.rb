class Item < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: [:name], using: { tsearch: { prefix: true} }
  has_many :list_items, dependent: :delete_all, inverse_of: :item
end
