# frozen_string_literal: true

class ListItemReflex < ApplicationReflex
  def create_list_item(list_item_data)
    list_item_attributes = item_create_hash(list_item_data)
    ListItem.create!(list_item_attributes)
    List.find(list_item_data['listId']).touch
  end

  def delete_list_item()
    list_item_id = element.dataset[:"item-list-id"]
    ListItem.find(list_item_id).destroy
  end

  def autocomplete_item()
    value = element["value"]
    @items = Item.search_by_name(value)
  end

  private

  def item_create_hash(hash)
    {
      list_id: hash['listId'],
      quantity: hash['itemQuantity'],
      item_id: (hash['itemId'] if hash['itemId'].present?),
      item_attributes: ({
        name: hash['itemName'],
      } if hash['itemId'].blank?)
    }.compact
  end
end
