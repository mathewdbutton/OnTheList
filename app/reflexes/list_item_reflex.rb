# frozen_string_literal: true

class ListItemReflex < ApplicationReflex
  include CableReady::Broadcaster

  def create_list_item(list_item_data)
    list_item_attributes = item_create_hash(list_item_data)
    ListItem.create!(list_item_attributes)
    List.find(list_item_data["listId"]).touch

    cable_ready["list_item_created"].set_dataset_property(
      selector: "#list-item-name",
      name: "givefocus",
      value: "true"
    )
    cable_ready.broadcast
  end

  def delete_list_item
    list_item_id = element.dataset[:"item-list-id"]
    ListItem.find(list_item_id).destroy
  end

  def autocomplete_item
    value = element['value']
    @items = Item.search_by_name(value)
  end

  private

  def item_create_hash(hash)
    {
      list_id: hash['listId'],
      quantity: hash['itemQuantity'],
      **new_or_existing_item_details(hash)
    }
  end

  def new_or_existing_item_details(hash)
    if hash['itemId'].present?
      { item_id: hash['itemId'] }
    else
      { item_attributes: { name: hash['itemName'] } }
    end
  end
end
