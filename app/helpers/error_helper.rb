module ErrorHelper
  def render_error(title, message, status)
    render json: {
      error: {
        title: title,
        message: message
      }
    }, status: status
  end

  def error_request(message = 'Request error !', status = :bad_request)
    title = 'Your request has been rejected !'
    render_error(title, message, status)
  end

  def error_formatter(resource, status = :unprocessable_entity)
    title = 'An error occured !'
    message = resource.errors.full_messages.join('; ') || 'No error details !'
    render_error(title, message, status)
  end
end
