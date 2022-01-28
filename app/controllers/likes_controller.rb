class LikesController < ApplicationController
  before_action :find_post, only: [:create]
  before_action :find_like

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(user_id: current_user.id)
      #params[ :like ][ :user_id ] = current_user.id  # ?
      #@like = Like.new(like_params)
      redirect_to posts_path  # ?
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id]) # знайти потрібну статтю методом find
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end

  def like_params
    params.require(:like).permit(:value, :user_id, :post_id)
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
