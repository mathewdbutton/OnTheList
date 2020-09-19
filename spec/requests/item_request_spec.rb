require "rails_helper"

RSpec.describe "Items", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/items"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      item = create(:item)

      get "/items/#{item.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
