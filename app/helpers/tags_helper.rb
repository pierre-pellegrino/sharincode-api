module TagsHelper
  def render_tags
    render json: {
      message: "All tags currently in the database",
      "tags": @tags
    }, status: :ok
  end

  def render_tag
    render json: {
      message: "New tag created !",
      "tag": @tag
    }, status: :ok
  end
end
