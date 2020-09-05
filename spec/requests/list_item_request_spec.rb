require "rails_helper"

RSpec.describe "ListItems", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/list_item/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /lists/1/list_items" do
    let(:list) { create(:list) }
    it "creates a list item" do
      expect {
        post("/lists/#{list.id}/list_items", params: {quantity: "4", item_attributes: {name: "Tomatoes"}})
      }.to change { ListItem.count }.from(0).to(1)
    end
  end
end
