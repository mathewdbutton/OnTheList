class ListItemsController < ApplicationController
  include CableReady::Broadcaster
  def index
    @list_items = ListItem.includes(:item).where(list_id: params[:list_id])
    @list = List.find(params[:list_id])
    @list_item ||= @list.list_items.build
    @item ||= @list_item.build_item
    @items ||= []
    @partial_quantity ||= ""
  end

  def create
    result = CreateListItem.new.call(params.to_unsafe_hash[:list_item])
    if result.success?

      cable_ready["list_item_created"].insert_adjacent_html(
        selector: "#list-item-list",
        position: "beforeend",
        html: render(ListItemRecordComponent.new(list_item_record: result.success, allow_delete: true))
      )

      cable_ready.broadcast
      head :created
    else
      render status: :bad_request, json: result.failure.errors.to_h
    end
  end
end
