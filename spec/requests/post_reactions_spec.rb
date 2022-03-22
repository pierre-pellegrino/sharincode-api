require 'rails_helper'

RSpec.describe "PostReactions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/post_reactions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/post_reactions/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/post_reactions/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/post_reactions/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
