class ListItemsController < ApplicationController
  def index
    @list_items = ListItem.where(list_id: params[:list_id])
    @list = List.find(params[:list_id])
    @list_item ||= @list.list_items.build
    @item ||= @list_item.build_item
    @items ||= []
  end

  def create
    binding.pry
    result = CreateListItem.new.call(params.to_unsafe_hash[:list_item])
    if result.success?
      head :created
    else
      render status: :bad_request, json: result.failure.errors.to_h
    end
  end
end
