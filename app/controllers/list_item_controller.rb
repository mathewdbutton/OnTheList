class ListItemController < ApplicationController
  def index
    @list_items = ListItem.where(list_id: params[:list_id])
    @list = List.find(params[:list_id])
    @items ||= []
  end
end
