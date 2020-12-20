class ItemSearchResultComponent < ViewComponent::Base
  include ViewComponent::Slotable

  with_slot :action

  attr_reader :item

  def initialize(item:, quantity:)
    @item = item
    @quantity = quantity
  end

  def quantity
    return "" unless @quantity.present?
    @quantity.to_s
  end
end
