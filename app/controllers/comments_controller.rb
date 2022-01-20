class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])  # знайти потрібну статтю методом find
    @comment = @post.comments.create(comment_params)  # create метод асоціації has_many для створення і збереження комента
    redirect_to post_path(@post)  # перенаправити юзера на сторінку зі статтею за допомогою хелпера post_path.
    # викликає у контроллері PostController метод show, який відображає show.html.erb сторінку
  end

  def destroy
    @post = Post.find(params[:post_id])  #знайти потрібну статтю
    @comment = @post.comments.find(params[:id])  #знайти потрібний комент
    @comment.destroy  #видалити його
    redirect_to post_path(@post) # і повернутись на сторінку статті
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
