class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    user = get_user_from_token
    avatar = rails_blob_url(user.avatar) if user.avatar.attached?
    render json: {
      user: user,
      avatar: avatar
    }, status: :ok
  end

  def update
    if current_user.update(user_params)
      render_user_json
    else
      error_formatter(current_user)
    end
  end

  private

  def get_user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                  Rails.application.credentials.devise[:jwt_secret_key]).first
    user_id = jwt_payload['sub']
    User.find(user_id.to_s)
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
