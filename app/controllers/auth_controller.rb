class AuthController < ApplicationController
  include HTTParty

  def index
    get_user_data
    @user = User.from_github(@user_data)
    jwt = Warden::JWTAuth::UserEncoder.new.call(@user, :user, nil)

    sign_in @user

    response.set_header('Authorization', "Bearer #{jwt[0]}")
    render_user('signed in')
  end

  private

  def get_access_token
    client_id = Rails.application.credentials.dig(:github, :client_id)
    client_secret = Rails.application.credentials.dig(:github, :client_secret)
    code = params[:code]
    url = "https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}"
    headers = {
      Accept: 'application/json'
    }

    response = HTTParty.post(url, {
                               headers: headers
                             })
    response.parsed_response['access_token']
  end

  def get_user_data
    url = 'https://api.github.com/user'
    access_token = get_access_token
    headers = {
      Authorization: "token #{access_token}",
      Accept: 'application/json'
    }

    response = HTTParty.get(url, {
                              headers: headers
                            })
    @user_data = response.parsed_response
  end
end
