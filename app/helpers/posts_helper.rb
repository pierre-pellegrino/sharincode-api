module PostsHelper
  def format_post(post)
    avatar = rails_blob_url(post.user.avatar) if post.user.avatar.attached?
    {
      post: {
        id: post.id,
        description: post.description,
        created_at: post.created_at,
        updated_at: post.updated_at,
        user: {
          username: post.user.username,
          avatar: avatar
        },
        snippets: post.snippets,
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
