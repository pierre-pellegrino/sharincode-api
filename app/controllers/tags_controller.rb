class TagsController < ApplicationController
  include TagsHelper
  before_action :authenticate_user!, only: %i[create]
  before_action :tag_not_exists, only: %i[create]

  def index
    @tags = Tag.all
    render_tags
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save || error_formatter(@tag) && return
    render_tag
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end

  def tag_not_exists
    return unless Tag.find_by(title: params[:title])
    message = 'Tag already exists in the database !'
    error_request(message)
  end
end
