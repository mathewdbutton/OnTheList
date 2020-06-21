# frozen_string_literal: true

class ListItemReflex < ApplicationReflex
  def create_list_item(list_item_data)
    ListItem.create!(list_id: list_item_data['listId'], item_attributes: list_item_data['itemData'])
    List.find(list_item_data['listId']).touch
  end

  def delete_list_item()
    list_item_id = element.dataset[:"item-list-id"]
    ListItem.find(list_item_id).destroy
  end
end
