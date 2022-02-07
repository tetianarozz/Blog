module PostsHelper
  def author?
    @post[:user_id] == session[:user_id]
    #@post.user_id == current_user
  end
end