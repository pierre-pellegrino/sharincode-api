class ApplicationController < ActionController::API
  
  def error_formatter(resource, status = :unprocessable_entity)
    render json: {
      error: {
        title: "An error occured !",
        message: resource.errors.full_messages.join('; ')
      }
    }, status: status
  end

  def render_user(message = nil, user = current_user)
    avatar = rails_blob_url(user.avatar) if user.avatar.attached?
    render json: {
      message: message,
      user: user,
      avatar: avatar,
      snippets: user.snippets
    }, status: :ok
  end

  def split_endpoints
    @page = if params[:page]
              params[:page].to_i
            else
              1
            end
  end
end
