class RecipeController < ApplicationController
  # Recipe = Struct.new(:lists, :title, :method_list, :description, :id)
  Method = Struct.new(:step, :replacements, :ordering)
  def index
    @recipes = Recipe.all
    @recipe = Recipe.new
  end

  def show
    permitted_params = Dry::Schema.Params {
      required(:id).filled(:integer)
    }.call(params.to_unsafe_hash)
    @recipe = Recipe.find(permitted_params.to_h[:id])
  end

  def edit
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
      redirect_to action: "show", id: recipe.id
    else
      render status: 400, json: permitted_params.errors.to_h.to_json
    end
  end
end
