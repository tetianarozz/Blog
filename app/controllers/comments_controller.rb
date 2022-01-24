class CommentsController < ApplicationController
  before_action :find_post, only: [:create, :destroy]
  # готовий метод, який запускає дію перед кожним методом
  #
  def create
    @comment = @post.comments.create(comment_params)  # create метод асоціації has_many для створення і збереження комента
    redirect_to post_path(@post)  # перенаправити юзера на сторінку зі статтею за допомогою хелпера post_path.
    # викликає у контроллері PostController метод show, який відображає show.html.erb сторінку
  end

  def destroy
    @comment = @post.comments.find(params[:id])  #знайти потрібний комент
    @comment.destroy  #видалити його
    redirect_to post_path(@post) # і повернутись на сторінку статті
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def find_post
    @post = Post.find(params[:post_id]) # знайти потрібну статтю методом find
  end
end
