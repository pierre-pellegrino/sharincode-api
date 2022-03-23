class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user,only: [:show]

  def show
    message = 'This is the profile you requested :'
    render_user(message, @user)
  end

  def update
    current_user.update(user_params) || error_formatter(current_user) && return
    message = 'Profile correctly updated !'
    render_user(message)
  end

  def destroy
    current_user.destroy || error_formatter(current_user) && return
    message = 'Profile correctly deleted !'
    success_request(message)
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

  def set_user
    @user = current_user
    @user = User.find(params[:id]) if params[:id]
  end

end
