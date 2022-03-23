module ErrorHelper
  def error_formatter(resource, status = :unprocessable_entity)
    render json: {
      error: {
        title: 'An error occured !',
        message: resource.errors.full_messages.join('; ')
      }
    }, status: status
  end

  def error_request(message = 'Request error !')
    render json: {
      title: 'Your request has been rejected !',
      message: message
    }, status: :unprocessable_entity
  end
end
