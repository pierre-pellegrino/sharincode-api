class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    user = current_user
    user = User.find(params[:id]) if params[:id]
    message = 'This is the profile you asked :'
    render_user(message, user)
  end

  def update
    error_formatter(current_user) && return unless current_user.update(user_params)

    message = 'Profile correctly updated !'
    render_user(message, current_user)
  end

  def destroy
    error_formatter(current_user) && return unless current_user.destroy

    render json: {
      message: 'User deleted from the database !'
    }, status: :ok
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
        :favorite_theme,
        :avatar
      )
  end
end
