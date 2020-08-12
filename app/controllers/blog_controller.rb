class BlogController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = Comment.where(article_id: params[:id])
    @comment = Comment.new
  end

  def create_comment
    @comment = Comment.new(comment_params)
    if @comment.update!(article_id: params[:article_id], user_id: params[:user_id])
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
