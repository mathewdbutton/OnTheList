class HomeController < ApplicationController
  def dashboard
    @show_recipes = false
    if request.headers["show-recipe"] == "yep"
      @show_recipes = true
    end
    @lists = List.limit(5).order(updated_at: :desc).all
    @items = Item.limit(5).order(updated_at: :desc).all
  end
end
