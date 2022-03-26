require 'rails_helper'

describe 'get all reactions route', type: :request do
  let!(:reactions) { FactoryBot.create_list(:reaction, 5) }

  before { get '/reactions' }

  it 'returns all reactions' do
    expect(JSON.parse(response.body)['reactions'].size).to eq(5)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
