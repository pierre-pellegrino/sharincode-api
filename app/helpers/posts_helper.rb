module PostsHelper
  def format_post(post)
    {
      post: {
        id: post.id,
        description: post.description,
        created_at: post.created_at,
        updated_at: post.updated_at,
        snippets: post.snippets
      }
    }
  end

  def render_post_json(post)
    render json: format_post(post)
  end

  def unauthorized_user_error
    render json: {
      error: {
        title: "Vous n'etes pas authorisé a editer ou supprimer un post ne vous appartenant pas"
      }
    }
  end
end
