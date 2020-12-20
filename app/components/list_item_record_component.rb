class ListItemRecordComponent < ViewComponent::Base
  attr_reader :list_item, :allow_delete
  def initialize(list_item_record:, allow_delete:)
    @list_item = list_item_record
    @allow_delete = allow_delete
  end

  def quantity
    return "" unless list_item.quantity.present?
    list_item.quantity.to_s
  end
end
