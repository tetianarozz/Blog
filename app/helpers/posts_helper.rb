module PostsHelper
  def author?
    @post.user_id == current_user.id
  end
end