class PostReactionsController < ApplicationController
  def index
  end

  def create
    @post_reaction = PostReaction.new(reaction_params)
    @post_reaction.title = Reaction.find_by(title: params[:reaction_title])
    @post_reaction.user = current_user
    @post_reaction.post = Post.find(params[:post_id])
    error_formatter(@post_reaction) && return unless @post_reaction.save
    render json: {
      message: "Reaction added !",
      "reaction": :@post_reaction
    }
  end

  def update
  end

  def delete
  end

  private

  def reaction_params
    params.require(:post_id, :reaction_title)
  end
  
end
