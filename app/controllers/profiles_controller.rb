class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, only: [:show]
  before_action :split_endpoints, only: [:index]

  def index
    render_filtered_results_list(User.all.map(&:"#{@filter}"), 'users')&& return unless @filter.nil?
  end

  def show
    message = 'This is the profile you requested :'
    render_user(message, @user)
  end

  def update
    current_user.update(user_params) || error_update && return
    message = 'Profile correctly updated !'
    render_user(message, current_user)
  end

  def destroy
    current_user.destroy || error_destroy && return
    message = 'Profile correctly deleted !'
    success_request(message)
  end

  private

  def user_params
    params
      .permit(
        :username,
        :description,
        :github_url,
        :personal_url,
        :favorite_theme,
        :avatar
      )
  end

  def set_user
    @user = current_user
    @user = User.find(params[:id]) if params[:id]
  end

  def error_update
    error_formatter(current_user)
  end

  def error_destroy
    error_formatter(current_user)
  end
end
