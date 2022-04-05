class PostsController < ApplicationController
  include PostsHelper
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, except: %i[index create]
  before_action :authorized_user?, only: %i[update destroy]
  before_action :split_endpoints

  def index
    render_filtered_posts_list(Post.all.map(&:"#{@filter}")) && return unless @filter.nil?
    @posts = []
    prepare_posts_list
    render_posts_list
  end

  def show
    render_post_json(@post)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    params[:snippets] || error_no_snippet_given && return
    create_snippets
    @post.save || error_formatter(@post) && return
    attach_tags(params[:tags]) if params[:tags]
    render_post_json(@post)
  end

  def update
    update_snippets
    @post.update(post_params) || error_formatter(@post) && return
    update_tags if params[:tags]
    render_post_json(@post)
  end

  def destroy
    @post.destroy || error_formatter(@post) && return
    message = 'Post successfully deleted !'
    status = :accepted
    success_request(message, status)
  end

  private

  def post_params
    params.permit(:description)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def authorized_user?
    return if current_user.id == @post.user_id

    message = 'You are not an authorized user for this action !'
    status = :unauthorized
    error_request(message, status)
  end

  def prepare_posts_list
    limit = 10
    Post.all.order('created_at desc').limit(limit).offset((@page - 1) * limit).each do |post|
      @posts << format_post(post)
    end
  end

  def create_snippets
    params[:snippets].each do |snippet|
      new_snippet = Snippet.new(content: snippet[:content], language: snippet[:language], post: @post)
      new_snippet.save || error_formatter(snippet)
    end
  end

  def update_snippets
    params[:snippets] || return
    params[:snippets].each do |snippet|
      snip = Snippet.find(snippet[:id])
      if snippet[:destroy] == true
        snip.destroy!
      else
        snip.update(content: snippet[:content], language: snippet[:language])
      end
    end
  end

  def attach_tags(tags)
    tags.each do |tag_title|
      tag = Tag.find_by(title: tag_title) || Tag.create(title: tag_title)
      attach_tag(tag)
    end
  end

  def attach_tag(tag)
    post_tag = PostTag.new(post: @post, tag: tag)
    post_tag.save || error_formatter(tag)
  end

  def update_tags
    PostTag.where(post: @post).destroy_all
    params[:tags].each do |tag_title|
      tag = Tag.find_by(title: tag_title) || Tag.create(title: tag_title)
      PostTag.create(post: @post, tag: tag) unless PostTag.find_by(post: @post, tag: tag)
    end
  end
end
