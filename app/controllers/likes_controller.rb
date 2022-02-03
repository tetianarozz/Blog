class LikesController < ApplicationController
  before_action :authorized
  before_action :find_post
  before_action :find_like

  def like
    if @like
      @like.destroy if @like.like?
    else
      @like = @post.likes.create(like: true, user: current_user)
    end
  end

  def dislike
    if @like
      @like.destroy if @like.dislike?
    else
      @like = @post.likes.create(dislike: true, user: current_user)
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id]) # знайти потрібну статтю методом find
  end

  def find_like
    @like = @post.likes.find_by(user: current_user)
  end
end
