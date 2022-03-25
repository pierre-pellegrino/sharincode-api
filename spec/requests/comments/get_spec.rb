require 'rails_helper'

describe "get all comment associated to a post", type: :request do
  @post = FactoryBot.create(:post)
  let!(:comments) { FactoryBot.create_list(:comments, 5, post: @post) }

  before { get "/posts/#{@post.id}" }

  it 'should return all the comments' do
    expect(JSON.parse(response.body)['comments'].size).to eq(5)
  end

  it 'should return a sucess code' do
    expect(response).to have_http_status(:success)
  end
end
