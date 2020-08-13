module ArticlesHelper
  def prev_article
    Article.prev_article(params[:id])
  end

  def next_article
    Article.next_article(params[:id])
  end
end
