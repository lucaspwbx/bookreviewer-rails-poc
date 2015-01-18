class BooksController < ApplicationController
  def index
    book = Book.all
    render json: book, status: 200
  end

  def create
    book = Book.create(book_params)
    if book.save
      render json: book, status: 201, location: book_path(book)
    else
      render json: book.errors, status: 422
    end
  end

  def show
    book = Book.find(params[:id])
    if book
      render json: book, status: 200
    else
      render nothing: true, status: 404
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update_attributes(book_params)
      render json: book, status: 200
    else
      render nothing: true, status: 422
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      head :no_content
    else
      render nothing: true, status: 422
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :pages, :language)
  end
end
