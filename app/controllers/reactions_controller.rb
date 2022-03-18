class ReactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @reaction = PostTag.new(reaction_params)
    error_formatter(@reaction) && return unless @reaction.save
    render json: {
      message: "Reaction has been added to the post for the current user !",
      "reaction": @reaction
    }, status: :ok
  end

  def destroy
  end

  private

  def reaction_params
    params.require(:user, :post).permit(:title)
  end
end
