# frozen_string_literal: true

class RecipeItemReflex < ApplicationReflex
  def delete_recipe_item
    recipe_item_id = element.dataset[:"recipe-item-id"]
    RecipeItem.find(recipe_item_id).destroy
  end
end
