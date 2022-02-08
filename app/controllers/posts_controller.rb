class PostsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # готовий метод, який запускає дію перед кожним методом

  impressionist :actions=>[:show,:index]

  def new   # відображає форму з новим об'єктом (в БД немає ще)
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user: current_user))
    # @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path  # перекидає на іншу сторінку
    else
      render :new   # ще раз передивиться запрос new
    end
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def edit   # відображає форму з існуючим об'єктом БД
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path  # перекидає на іншу сторінку
    else
      render :edit # ще раз передивиться запрос edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path    # на "posts#index"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body,)  # permit фільтрує параметри які можна оновлювати
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
