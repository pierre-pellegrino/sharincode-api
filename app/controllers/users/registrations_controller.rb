class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password)
  end

  # CHANGEMENT DU MOT DE PASSE
  # def account_update_params
  #   params.require(:user).permit(:username, :email, :password, :passord_confirmation, :current_password)
  # end

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render_user_json('Signed up sucessfully.')
  end

  def register_failed
    error_formatter(resource)
  end
end