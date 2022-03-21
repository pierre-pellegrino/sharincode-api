class PostReactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post_reaction

  def create
    error_request('Reaction already exist !') && return if @post_reaction
    @post_reaction = PostReaction.new(post_reaction_params)
    @post_reaction.user = current_user
    @post_reaction.post = Post.find(params[:post_id])
    @post_reaction.reaction = Reaction.find_by(title: params[:name]) || Reaction.first
    error_formatter(@post_reaction) && return unless @post_reaction.save

    render json: {
      message: "Reaction created !",
      "reaction": @post_reaction
    }
  end

  def destroy
    error_request('No reaction to delete !') && return unless @post_reaction
    error_formatter(@post_reaction) && return unless @post_reaction.destroy

    render json: {
      message: "Reaction deleted !"
    }
  end

  private

  def set_post_reaction
    @post_reaction = PostReaction.find_by(user: current_user, post_id: params[:post_id])
  end

  def post_reaction_params
    params.permit(:title)
  end

end