module PostsHelper
  def format_comments(comments)
    result = []
    comments.each do |comment|
      avatar = rails_blob_url(comment.user.avatar) if comment.user.avatar.attached?
      result << {
        comment: {
          id: comment.id,
          content: comment.content,
          created_at: comment.created_at,
          updated_at: comment.updated_at,
          username: comment.user.username,
          avatar: avatar
        }
      }
    end
    result
  end

  def format_post(post)
    avatar = rails_blob_url(post.user.avatar) if post.user.avatar.attached?
    snippets = [] if !post.snippets
    comments = [] if !post.comments
    tags = [] if !post.tags
    {
      post: {
        id: post.id,
        description: post.description,
        created_at: post.created_at,
        updated_at: post.updated_at,
        user: {
          username: post.user.username,
          avatar: avatar,
          user_id: post.user_id
        },
        snippets: post.snippets,
        comments: format_comments(post.comments.order('created_at desc')),
        tags: post.tags,
        reactions: post.post_reactions
      }
    }
  end

  def render_post_json(post)
    render json: format_post(post)
  end
end
