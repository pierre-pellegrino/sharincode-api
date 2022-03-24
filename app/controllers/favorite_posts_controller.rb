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
    @post = Post.find(params[:id])

    if current_user.id != @post.user.id
      render json: {
        error: {
          title: "can't remove favorite posts from other users"
        }
      }
      return
    end

    @post.destroy

    render json: {
      message: 'post removed from favorites'
    }
  end
end
