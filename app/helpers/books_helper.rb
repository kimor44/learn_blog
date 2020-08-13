module BooksHelper
  def prev_book
    Book.prev_book(params[:id])
  end

  def next_book
    Book.next_book(params[:id])
  end
end
