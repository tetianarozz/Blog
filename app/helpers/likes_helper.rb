module LikesHelper
  def like_count(post)
    post.likes.where(like: true).count
  end

  def dislike_count(post)
    post.likes.where(dislike: true).count
  end

  def liked?(post)
    post.likes.where(like: true, user: current_user).present?
  end

  def disliked?(post)
    post.likes.where(dislike: true, user: current_user).present?
  end

end
