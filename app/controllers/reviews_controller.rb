class ReviewsController < ApplicationController
  def index
    book = Book.find(params[:book_id])
    render json: book.reviews, status: 200
  end

  def create
    book = Book.find(params[:book_id])
    review = Review.new(review_params)
    if book
      book.reviews << review
      book.save
      render json: review, status: 201, location: book_review_path(book, review)
    else
        render nothing: true, status: 422
    end
  end

  def show
    book = Book.find(params[:book_id])
    review = book.reviews.find(params[:id])
    if review
      render json: review, status: 200
    else
      render nothing: true, status: 404
    end
  end

  def update
    book = Book.find(params[:book_id])
    review = book.reviews.find(params[:id])
    if review.update_attributes(review_params)
      render json: review, status: 200
    else
      render nothing: true, status: 422
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    review = book.reviews.find(params[:id])
    if review.destroy
      head :no_content
    else
      render nothing: true, status: 422
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :name)
  end
end
