class ListItemRecordComponent < ViewComponent::Base
  attr_reader :list_item
  def initialize(list_item_record:, allow_delete:)
    @list_item = list_item_record
    @allow_delete = allow_delete
  end

  def quantity
    return "" unless list_item.quantity
    "- #{list_item.quantity}"
  end
end
