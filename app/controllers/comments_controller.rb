class CommentsController < ApplicationController
  include CommentsHelper

  before_action :authenticate_user!, only: %i[create update destroy]

  def create
    @comment = Comment.new(comment_params)
    error_formatter(@comment) && return unless @comment.save

    render_comment_json(@comment)
  end

  def update; end

  def destroy; end

  private

  def comment_params
    params.permit(:content)
  end
end
