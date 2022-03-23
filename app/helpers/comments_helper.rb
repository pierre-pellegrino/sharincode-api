module CommentsHelper
  def format_comment(comment)
    avatar = rails_blob_url(comment.user.avatar) if comment.user.avatar.attached?
    {
      comment: {
        id: comment.id,
        content: comment.content,
        username: comment.user.username,
        avatar: avatar,
        created_at: comment.created_at,
        updated_at: comment.updated_at
      }
    }
  end

  def render_comment_json(comment)
    render json: format_comment(comment)
  end

  def unauthorized_user_error
    render json: {
      error: {
        title: 'You are not authorized to edit or delete this comment !'
      }
    }
  end
end
