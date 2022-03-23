class PostsController < ApplicationController
  include PostsHelper
  before_action :authenticate_user!, except: %i[index]
  before_action :set_post, except: %i[index create]
  before_action :authorized_user?, only: %i[update destroy]
  before_action :split_endpoints

  def index
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
    create_post_snippets || return
    @post.save || error_formatter(@post) && return
    attach_post_tags
    render_post_json(@post)
  end

  def update
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
    @post.destroy
    Snippet.where(post_id: @post.id).each(&:destroy)
    render json: {
      message: "Post successfully deleted !"
    }, status: :ok
  end

  private

  def post_params
    params.require(:post).permit(:description)
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

  def create_post_snippets
    params[:snippets] || error_no_snippet_given && return
    params[:snippets].each do |snippet|
      new_snippet = Snippet.new(content: snippet[:content], language: snippet[:language], post: @post)
      new_snippet.save || error_formatter(snippet)
    end
  end

  def attach_post_tags
    params[:tags] || return
    params[:tags].each do |tag|
      tagger = Tag.find_by(title: tag) || Tag.create(title: tag)
      post_tag = PostTag.new(post: @post, tag: tagger)
      post_tag.save || error_formatter(tag)
    end
  end
end
