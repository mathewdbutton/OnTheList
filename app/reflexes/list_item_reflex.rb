# frozen_string_literal: true

class ListItemReflex < ApplicationReflex
  def create_list_item(list_item_data)
    if list_item_data['itemId'].present?
      ListItem.create!(list_id: list_item_data['listId'], item_id: list_item_data['itemId'])
    else
      ListItem.create!(list_id: list_item_data['listId'], item_attributes: list_item_data['itemData'])
    end
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
end
