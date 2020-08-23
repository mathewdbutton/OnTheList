class RecipeController < ApplicationController
  Recipe = Struct.new(:lists, :title, :method_list, :description, :id)
  Method = Struct.new(:step, :replacements, :ordering)
  def index
    methods = [Method.new("Add %s and then mix in with %s", ListItem.all.sample(2), 1), Method.new("Now add 3 of %s and then blend to stiff peaks form", ListItem.all.sample(1), 2)]
    @recipes = [Recipe.new(List.all.take(2), "Orzo Soup", methods, "It's bloody good", 1)]
  end

  def show
    methods = [Method.new("Add %s and then mix in with %s", ListItem.all.sample(2), 1), Method.new("Now add 3 of %s and then blend to stiff peaks form", ListItem.all.sample(1), 2)]
    @recipe = Recipe.new(List.all.take(2), "Orzo Soup", methods, "It's bloody good", 1)
  end
end
