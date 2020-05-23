class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
    Book.create(title: params[:title])
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    Book.find(params[:id]).update title: params[:book][:title]
    redirect_to books_show_path(params[:id])
  end
end
