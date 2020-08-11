class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
    @categories = Category.all
  end

  def create
    Book.create(title: params[:title], category_id: params[:category_id])
    redirect_to books_index_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    Book.find(params[:id]).update title: params[:book][:title]
    redirect_to books_show_path(params[:id])
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_index_path
  end
end
