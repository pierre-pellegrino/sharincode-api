class PostsController < ApplicationController
  include PostsHelper

  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_post, only: %i[show update destroy]
  before_action :split_endpoints

  def index
    limit = 10
    @posts = []
    Post.all.order('created_at desc').limit(limit).offset((@page - 1) * limit).each do |post|
      @posts << format_post(post)
    end
    render json: {
      posts: @posts
    }
  end

  def show
    render_post_json(@post)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    error_formatter(@post) && return unless @post.save
    error_formatter(@post) && return if !@post.snippets

    params[:snippets].each do |snippet|
      snip = Snippet.new(content: snippet[:content], language: snippet[:language], post: @post)
      error_formatter(snippet) unless snip.save
    end

    params[:tags].each do |tag|
      t = Tag.find_by(title: tag)
      t = Tag.create(title: tag) unless t
      post_tag = PostTag.new(post: @post, tag: t)
      error_formatter(tag) unless post_tag.save
    end

    render_post_json(@post)
  end

  def update
    unauthorized_user_error && return if current_user.id != @post.user_id

    if @post.update(post_params)
      params[:snippets].each do |snippet|
        if snippet[:destroy] == true
          Snippet.find(snippet[:id]).destroy!
        else
          Snippet.find(snippet[:id]).update(content: snippet[:content], language: snippet[:language])
        end
      end
    end
    render_post_json(@post)
  end

  def destroy
    unauthorized_user_error && return if current_user.id != @post.user_id

    @post.destroy
    Snippet.where(post_id: @post.id).each(&:destroy)
    render json: {
      message: "Post successefully deleted !"
    }, status: :ok
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description)
  end
end
