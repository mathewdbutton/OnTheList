class ListItemManagementChannel < ApplicationCable::Channel
  def subscribed
    stream_from "list_item_created"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
