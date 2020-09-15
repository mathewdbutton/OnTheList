class RecipeItemsController < ApplicationController
  def create
    permitted_params = Dry::Schema.Params {
      optional(:quantity).maybe(:string)
      required(:item_attributes).hash do
        optional(:id).filled(:integer)
        required(:name).filled(:string)
      end
      required(:recipe_id).filled(:integer)
    }.call(params.to_unsafe_hash[:recipe_item])

    if permitted_params.success?
      recipe = RecipeItem.create!(permitted_params.to_h)
      head :created
    else
      render status: 400, json: permitted_params.errors.to_h.to_json
    end
  end
end
