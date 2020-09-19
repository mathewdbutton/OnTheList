class RecipeController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipe = Recipe.new
  end

  Permitted_Params = Dry::Schema.Params {
    required(:id).filled(:integer)
  }

  def show
    permitted_params = Permitted_Params.call(params.to_unsafe_hash)
    @recipe = Recipe.find(permitted_params.to_h[:id])
  end

  def edit
    permitted_params = Permitted_Params.call(params.to_unsafe_hash)
    @recipe = Recipe.find(permitted_params.to_h[:id])
    @recipe_item = @recipe.recipe_items.build
    @item = @recipe_item.build_item
    @recipe_method = @recipe.recipe_methods.build
  end

  def update
  end

  def create
    permitted_params = Dry::Schema.Params {
      required(:title).filled(:string)
      optional(:description).maybe(:string)
    }.call(params.to_unsafe_hash[:recipe])

    if permitted_params.success?
      recipe = Recipe.create!(permitted_params.to_h)
      redirect_to action: "edit", id: recipe.id
    else
      render status: 400, json: permitted_params.errors.to_h.to_json
    end
  end
end
