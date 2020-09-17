# frozen_string_literal: true

class RecipeMethodReflex < ApplicationReflex
  def delete_recipe_method
    recipe_method_id = element.dataset[:"recipe-method-id"]
    RecipeMethod.find(recipe_method_id).destroy
  end
end
