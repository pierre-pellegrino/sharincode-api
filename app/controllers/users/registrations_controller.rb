class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
  
  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?
    error_formatter(resource, :unauthorized)
  end
  
  def register_success
    message = 'New user sucessfully registered !'
    render_user(message)
  end
  
  def sign_up_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end