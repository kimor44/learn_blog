module ArticlesHelper
  def prev_article
    Article.where("id < #{params[:id]}").maximum(:id)
  end

  def next_article
    Article.where("id > #{params[:id]}").minimum(:id)
  end
end
