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
end
