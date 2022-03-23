module ErrorHelper
  def error_formatter(resource, status = :unprocessable_entity)
    title = 'An error occured !'
    message = resource.errors.full_messages.join('; ') || 'No error details !'
    render json: {
      error: {
        title: title,
        message: message
      }
    }, status: status
  end

  def error_request(message = 'Request error !', status = :bad_request)
    title = 'Your request has been rejected !'
    render json: {
      error: {
        title: title,
        message: message
      }
    }, status: status
  end

  def unauthorized_user_error
    title = 'Your request has been rejected !'
    message = 'You are not an authorized user for this action !'
    status = :unauthorized
    render json: {
      error: {
        title: title,
        message: message
      }
    }, status: status
  end
end
