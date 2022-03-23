module ApplicationHelper
  include ErrorHelper
  include PostsHelper

  def success_request(message = 'Request success !')
    render json: {
      title: 'Your request has been accepted !',
      message: message
    }, status: :ok
  end

  def render_user(message = nil, user = current_user)
    avatar = rails_blob_url(user.avatar) if user.avatar.attached?
    posts = []
    Post.where(user_id: user.id).each do |post|
      posts << format_post(post)
    end
    render json: {
      message: message,
      user: user,
      avatar: avatar,
      posts: posts
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
