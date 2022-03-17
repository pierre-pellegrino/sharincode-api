class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password)
  end

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?
    error_formatter(resource)
  end

  def register_success
    render_user('New user sucessfully registered !')
  end

end