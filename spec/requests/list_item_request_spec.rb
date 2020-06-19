require 'rails_helper'

RSpec.describe "ListItems", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/list_item/index"
      expect(response).to have_http_status(:success)
    end
  end

end
