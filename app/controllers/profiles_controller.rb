class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    message = 'Profile of the current user'
    render_user(message)
  end

  def update
    message = 'Profile correctly updated !'
    render_user(message) && return if current_user.update(user_params)
    error_formatter(current_user)
  end

  private

  def user_params
    params
      .require(:user)
      .permit(
        :username,
        :description,
        :github_url,
        :personal_url,
        :favorite_theme
      )
  end
end
