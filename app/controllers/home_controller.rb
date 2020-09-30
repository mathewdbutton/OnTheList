class HomeController < ApplicationController
  def dashboard
    @lists = List.limit(5).order(updated_at: :desc).all
    @items = Item.limit(5).order(updated_at: :desc).all
  end
end
