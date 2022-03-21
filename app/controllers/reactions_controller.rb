class ReactionsController < ApplicationController
  def index
    @reactions = Reaction.all
    render json: {
      message: "All reactions currently in the database",
      "reactions": @reactions
    }, status: :ok
  end
end
