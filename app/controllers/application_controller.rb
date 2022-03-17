class ApplicationController < ActionController::API
  def error_formatter(resource, status = :unprocessable_entity)
    render json: {
      error: {
        title: "une erreur s'est produite",
        message: resource.errors.full_messages.join('; ')
      }
    }, status: status
  end

  def render_user_json(message = nil)
    avatar = if current_user.avatar.attached?
               rails_blob_url(current_user.avatar)
             end
    render json: {
      message: message,
      id: current_user.id,
      email: current_user.email,
      username: current_user.username || nil,
      avatar: avatar
    }, status: :ok
  end
end
