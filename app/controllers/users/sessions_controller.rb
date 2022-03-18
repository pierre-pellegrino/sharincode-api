class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    login_success && return if current_user
    error_formatter(resource, :unauthorized)
  end

  def respond_to_on_destroy
    logout_success && return if !current_user
    error_formatter(resource, :unauthorized)
  end
  
  def login_success
    message = 'User successfully logged in !'
    render_user(message)
  end

  def logout_success
    message = 'User successfully logged out !'
    render json: {
      message: message
    }, status: :ok
  end

end