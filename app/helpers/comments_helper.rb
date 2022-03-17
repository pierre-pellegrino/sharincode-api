module CommentsHelper
  def render_comment_json(comment)
    avatar = rails_blob_url(post.user.avatar) if post.user.avatar.attached?
    render json: {
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
end
