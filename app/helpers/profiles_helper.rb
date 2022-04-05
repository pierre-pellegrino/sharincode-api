module ProfilesHelper
  def render_filtered_users_list(result)
    render json: {
      users_ids: result
    }
  end
end
