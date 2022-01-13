class PostsController < ApplicationController
  def show
    @post = Post.find_by id: params[:id]

  end

  def destroy
    @post = Post.find_by id: params[:id]
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find_by id: params[:id]
  end

  def update
    @post = Post.find_by id: params[:id]
    if @post.update post_params
      redirect_to posts_path  #перекидає на іншу сторінку
    else
      render :new #ще раз передивиться запрос new
    end
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to posts_path  #перекидає на іншу сторінку
    else
      render :new #ще раз передивиться запрос new
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
