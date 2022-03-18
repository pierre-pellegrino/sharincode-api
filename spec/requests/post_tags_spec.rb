require 'rails_helper'

RSpec.describe "PostTags", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/post_tags/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/post_tags/update"
      expect(response).to have_http_status(:success)
    end
  end

end
