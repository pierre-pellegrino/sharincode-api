class GithubAuth
  include HTTParty

  def initialize(code)
    @code = code
    @client_id = Rails.application.credentials.dig(:github, :client_id)
    @client_secret = Rails.application.credentials.dig(:github, :client_secret)
  end

  def get_access_token
    url = "https://github.com/login/oauth/access_token?client_id=#{@client_id}&client_secret=#{@client_secret}&code=#{@code}"
    headers = {
      Accept: 'application/json'
    }

    response = HTTParty.post(url, {
                               headers: headers
                             })

    @access_token = response.parsed_response['access_token']
  end

  def get_user_data
    url = 'https://api.github.com/user'
    get_access_token

    headers = {
      Authorization: "token #{@access_token}",
      Accept: 'application/json'
    }

    response = HTTParty.get(url, {
                              headers: headers
                            })

    @user_data = response.parsed_response
    get_private_email if @user_data['email'].nil?

    @user_data
  end

  def get_private_email
    url = 'https://api.github.com/user/emails'
    headers = {
      Authorization: "token #{@access_token}",
      Accept: 'application/json'
    }

    response = HTTParty.get(url, {
                              headers: headers
                            })

    @user_data['email'] = response.parsed_response[0]['email']
  end
end
