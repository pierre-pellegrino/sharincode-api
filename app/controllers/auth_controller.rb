class AuthController < ApplicationController
  def index
    oauth = GithubAuth.new(params[:code])
    @user = User.from_github(oauth.get_user_data)
    error_formatter(@user) && return unless @user.persisted?

    jwt = Warden::JWTAuth::UserEncoder.new.call(@user, :user, nil)

    sign_in @user

    response.set_header('Authorization', "Bearer #{jwt[0]}")
    render_user('signed in')
  end
end
