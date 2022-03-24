class FavoritePostsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = FavoritePost.new(
      post: Post.find(params[:post_id]),
      user: current_user
    )
    if post.save
      render json: {
        message: 'post added to favorites'
      }
    else
      error_formatter(post)
    end
  end

  def destroy
    @favorite_post = FavoritePost.find(params[:id])

    if current_user.id != @favorite_post.user_id
      render json: {
        error: {
          title: "can't remove favorite posts from other users"
        }
      }
      return
    end

    @favorite_post.destroy

    render json: {
      message: 'post removed from favorites'
    }
  end
end
