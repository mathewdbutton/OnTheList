# frozen_string_literal: true

class RecipeReflex < ApplicationReflex
  def delete_recipe
    id = element.dataset[:id]
    Recipe.find(id).destroy
  end
end
