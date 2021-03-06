class BlogController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def create_comment
    @article = Article.find(params[:article_id])

    @comment = Comment.create(comment_params)
    if @comment.update(article_id: params[:article_id], user_id: current_user.id)
      redirect_to blog_show_path(id: params[:article_id])
    else
      render :show
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
