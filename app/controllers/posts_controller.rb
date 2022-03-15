class PostsController < ApplicationController
  include PostsHelper

  before_action :authenticate_user!, only: %i[create update destroy]
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

  def create; end

  def update; end

  def destroy; end

  private

  def set_post
    @post = Post.find(params[:id])
    @snippets = Snippet.where(post_id: @post.id)
  end

  def post_params
    params.permit(:description)
  end
end
