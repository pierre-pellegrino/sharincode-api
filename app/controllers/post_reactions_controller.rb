class PostReactionsController < ApplicationController
  def index
  end

  def create
    @reaction = PostReaction.new(reaction_params)
    @reaction.title = params[:reaction_title]
    @reaction.user = current_user
    @reaction.post = Post.find(params[:post_id])
    error_formatter(@reaction) && return unless @reaction.save
    render json: {
      message: "Reaction added !",
      "reaction": :@reaction
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
