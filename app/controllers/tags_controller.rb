class TagsController < ApplicationController
  include TagsHelper
  before_action :authenticate_user!, only: %i[create]
  before_action :new_tag?, only: %i[create]

  def index
    @tags = Tag.all
    render_tags_list
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

  def new_tag?
    Tag.find_by(title: params[:title]) || return
    message = 'Tag already exists in the database !'
    status = :forbidden
    error_request(message, status)
  end
end
