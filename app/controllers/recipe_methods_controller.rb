class RecipeMethodsController < ApplicationController

  def create
    permitted_params = Dry::Schema.Params {
      required(:step).filled(:string)
      optional(:order).filled(:integer)
      optional(:recipe_item_ids).filled(:string)
      required(:recipe_id).filled(:integer)
    }.call(params.to_unsafe_hash[:recipe_method])

    if permitted_params.success?
      contract_values = NewRecipeMethodContract.new.call(convert_to_nested_params(permitted_params.to_h))

      recipe = RecipeMethod.create!(contract_values.to_h)
      head :created
    else
      render status: 400, json: permitted_params.errors.to_h.to_json
    end
  end

  private

  def convert_to_nested_params(params)
    ids = params[:recipe_item_ids].split(",").map(&:to_i)

    {**params, method_recipe_items: ids.map { |id| MethodRecipeItem.new(recipe_item_id: id) }}
  end

  class NewRecipeMethodContract < Dry::Validation::Contract
    method_recipe_item = Types.Instance(MethodRecipeItem)
    params do
      required(:step).filled(:string)
      optional(:order).filled(:integer)
      optional(:method_recipe_items).array(method_recipe_item)
      required(:recipe_id).filled(:integer)
    end
  end
end
