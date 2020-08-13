class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page]).per(5)
    @categories = Category.all
  end

  def create
    Book.create(title: params[:title], category_id: params[:category_id])
    redirect_to books_index_path
  end

  def show
    @book = Book.find(params[:id])
    @categories = Category.all
  end

  def update
    @book = Book.find(params[:id])
    @categories = Category.all
    if @book.update(title: params[:book][:title], category_id: params[:book][:category_id])
      redirect_to books_show_path(params[:id])
    else
      render :show
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_index_path
  end
end
