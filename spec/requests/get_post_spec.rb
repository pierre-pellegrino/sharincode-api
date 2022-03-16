require 'rails_helper'

describe "get all posts route", type: :request do
  let!(:posts) {FactoryBot.create_list(:random_post, 5)}

  before { get '/posts' }

  it 'returns all posts' do
    expect(JSON.parse(response.body)["posts"].size).to eq(5)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
