module LikesHelper
  def like_count(post)
    post.likes.where(like: true).count
  end

  def dislike_count(post)
    post.likes.where(dislike: true).count
  end
end