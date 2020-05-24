module BooksHelper
  def prev_book
    Book.where("id < #{params[:id]}").maximum(:id)
  end

  def next_book
    Book.where("id > #{params[:id]}").minimum(:id)
  end
end
