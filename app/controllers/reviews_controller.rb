class ReviewsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @reviews = Review.all
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @review = Review.new(review_params)
    @review.trip = @trip
    if @review.save
      redirect_to trip_path(@trip)
    else
      render "trips/show", status: :unprocessable_entity
    end
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @review = Review.new
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @review = Review.new
  end

  # private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
