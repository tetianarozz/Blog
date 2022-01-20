class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])  # знайти потрібну статтю методом find
    @comment = @post.comments.create(comment_params)  # create метод асоціації has_many  для створення і збереження комента
    redirect_to post_path(@post)  # перенаправити юзера на сторінку зі статтею за допомогою хелпера post_path.
    # викликає у контроллері PostController метод show, який відображає show.html.erb сторінку
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
