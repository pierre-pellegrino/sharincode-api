class TagsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def index
    @tags = Tag.all
    render json: {
      message: "All tags currently in the database",
      "tags": @tags
    }, status: :ok
  end

  def create
    @tag = Tag.new(tag_params)
    error_formatter(@tag) && return unless @tag.save
    render json: {
      message: "New tag created !",
      "tag": @tag
    }, status: :ok
  end

  private

  def tag_params
    params.permit(:title)
  end

end
