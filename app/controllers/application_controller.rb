class ApplicationController < ActionController::API
  include PostsHelper
  def error_formatter(resource, status = :unprocessable_entity)
    render json: {
      error: {
        title: "An error occured !",
        message: resource.errors.full_messages.join('; ')
      }
    }, status: status
  end

  def error_request(message = 'No error details provided')
    render json: {
      title: "Your request does not seem correct ...",
      message: message
    }, status: :unprocessable_entity
  end

  def render_user(message = nil, user = current_user)
    avatar = rails_blob_url(user.avatar) if user.avatar.attached?
    posts = []
    Post.where(user_id: user.id).each do |post|
      posts << format_post(post)
    end
    favorite_posts = []
    user.favorite_posts.each do |favorite|
      post = format_post(favorite.post)
      post[:favorite_id] = favorite.id
      favorite_posts << post
    end
    render json: {
      message: message,
      user: user,
      avatar: avatar,
      posts: posts,
      favorite_posts: favorite_posts
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
