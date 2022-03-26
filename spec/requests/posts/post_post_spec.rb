# require 'rails_helper'
# require './spec/helpers/authorization_helper'
# include AuthorizationHelper

# describe "post a post route", type: :request do
#   context  'works fine with an authnenticated user' do
#     before do
#       user = { email: 'post_tests@tests.com', password: 'password' }
#       token = sign_up(user)
#       post '/posts', params: {
#         description: 'un petit snippet tout pourri juste pour le test',
#         snippets: [
#           { content: "console.log('ceci est un test')" }
#         ]
#       },
#            headers: token
#     end

#     it 'returns the description' do
#       expect(JSON.parse(response.body)['post']['description']).to eq('un petit snippet tout pourri juste pour le test')
#     end

#     it 'return the user' do
#       expect(JSON.parse(response.body)['post']['user_id'].nil?).to eq(false)
#     end

#     it 'return status code 200' do
#       expect(response).to have_http_status(:success)
#     end
#   end

#   context 'should return an error if not authenticated' do
#     before do
#       post '/posts', params: {
#         description: 'un petit snippet tout pourri juste pour le test',
#         snippets: [
#           { content: "console.log('ceci est un test')" }
#         ]
#       }
#     end

#     it 'return status code 401' do
#       expect(response).to have_http_status(:unauthorized)
#     end
#   end
# end
