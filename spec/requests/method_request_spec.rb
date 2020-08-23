require 'rails_helper'

RSpec.describe "Methods", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/method/show"
      expect(response).to have_http_status(:success)
    end
  end

end
