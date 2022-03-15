module PostsHelper
  def format_post(post, snippets)
    {
      post: post,
      snippets: snippets
    }
  end

  def render_post_json(post, snippets)
    render json: format_post(post, snippets)
  end

  def unauthorized_user_error
    render json: {
      error: {
        title: "Vous n'etes pas authorisé a editer ou supprimer un post ne vous appartenant pas"
      }
    }
  end
end
