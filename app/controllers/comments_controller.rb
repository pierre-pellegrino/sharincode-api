class CommentsController < ApplicationController
  include CommentsHelper

  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_comment, only: %i[update destroy]

  def index
    @comments = []
    Post.find(params[:post_id]).comments.order('created_at desc').each do |comment|
      @comments << format_comment(comment)
    end
    render json: {
      comments: @comments
    }
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    error_formatter(@comment) && return unless @comment.save

    render_comment_json(@comment)
  end

  def update
    unauthorized_user_error && return if current_user.id != @comment.user.id
    error_formatter(@comment) && return unless @comment.update(comment_params)

    render_comment_json(@comment)
  end

  def destroy
    message = 'You are not authorized to delete this comment !'
    error_request(message) && return unless current_user == @comment.user
    error_formatter(@comment) && return unless @comment.destroy
    message = 'Comment has been deleted !'
    success_request(message)
  end

  private

  def comment_params
    params.permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
