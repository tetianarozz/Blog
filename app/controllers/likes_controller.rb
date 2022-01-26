class LikesController < ApplicationController
  before_action :find_post, only: [:create]

  def create
    params[ :like ][ :user_id ] = current_user.id
    @like = Like.new(like_params)
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:post_id]) # знайти потрібну статтю методом find
  end

  def like_params
    params.require(:like).permit(:value, :user_id, :reference_id, :reference_type)
  end
end
