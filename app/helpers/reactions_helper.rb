module ReactionsHelper
  def render_reactions
    render json: {
      message: "All reactions currently in the database",
      "reactions": @reactions
    }, status: :ok
  end
end
