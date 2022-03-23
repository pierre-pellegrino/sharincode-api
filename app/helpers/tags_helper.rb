module TagsHelper
  def render_tags_list
    render json: {
      message: "All tags currently in the database",
      "tags": @tags
    }, status: :ok
  end

  def render_tag
    render json: {
      message: "New tag created !",
      "tag": @tag
    }, status: :accepted
  end
end
