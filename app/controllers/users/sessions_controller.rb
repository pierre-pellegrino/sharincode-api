class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    render_user('User sucessfully loggued in !')
  end

  def respond_to_on_destroy
    log_out_success && return if !current_user
    log_out_failure
  end

  def log_out_success
    render json: { message: 'User successfully logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Hmm nothing happened.' }, status: :unauthorized
  end
end