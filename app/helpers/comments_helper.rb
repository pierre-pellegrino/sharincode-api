module CommentsHelper
  def format_comment(comment)
    avatar = rails_blob_url(post.user.avatar) if post.user.avatar.attached?
    {
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

  def render_comment_json(comment)
    render json: format_comment(comment)
  end

  def unauthorized_user_error
    render json: {
      error: {
        title: "Vous n'etes pas authorisé a editer ou supprimer un commentaire ne vous appartenant pas"
      }
    }
  end
end
