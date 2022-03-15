class PostsController < ApplicationController
  include PostsHelper

  #before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_post, only: %i[show update destroy]

  def index
    @posts = []
    Post.all.order('created_at desc').each do |post|
      @posts << format_post(post, Snippet.where(post_id: post.id))
    end
    render json: {
      posts: @posts
    }
  end

  def show
    render_post_json(@post, @snippets)
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.first
    if @post.save
      params[:snippets].each do |snippet|
        snip = Snippet.new(content: snippet[:content], post: @post)
        unless snip.save
          render json: {
            error: {
              title: "quelque chose c'est mal passé",
              message: snippet.errors.full_messages.join('; ')
            }
          }
        end
      end
      render_post_json(@post, Snippet.where(post_id: @post.id))
    else
      render json: {
        error: {
          title: "quelque chose c'est mal passé",
          message: @post.errors.full_messages.join('; ')
        }
      }
    end
  end

  def update
    unauthorized_user_error && return if current_user.id != @post.user_id

    if @post.update(post_params)
      params[:snippets].each do |snippet|
        if snippet.destroy
          Snippet.find(snippet.id).destroy!
        else
          Snippet.find(snippet.id).update(content: snippet[:content])
        end
      end
    end
    render_post_json(@post, Snippet.where(post_id: @post.id))
  end

  def destroy
    unauthorized_user_error && return if current_user.id != @post.user_id

    @post.destroy
    Snippet.where(post_id: @post.id).each(&:destroy)
  end

  private

  def set_post
    @post = Post.find(params[:id])
    @snippets = Snippet.where(post_id: @post.id)
  end

  def post_params
    params.permit(:description)
  end
end
