require "rails_helper"

RSpec.describe "ListItems", type: :request do
  let(:list) { create(:list) }

  describe "GET /index" do
    it "returns http success" do
      get "/lists/#{list.id}/list_items"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /lists/1/list_items" do
    it "creates a list item" do
      expect {
        post("/lists/#{list.id}/list_items", params: {list_item: {quantity: "4", item_attributes: {name: "Tomatoes"}, list_id: list.id}})
      }.to change { ListItem.count }.from(0).to(1)
    end

    it "responds with a 201" do
      post("/lists/#{list.id}/list_items", params: {list_item: {quantity: "4", item_attributes: {name: "Tomatoes"}, list_id: list.id}})

      aggregate_failures do
        expect(response).to have_http_status(201)
        expect(response.body).to eql("")
      end
    end
  end
end
