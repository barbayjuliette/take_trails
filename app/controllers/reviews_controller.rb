class ReviewsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @reviews = Review.all

  end

  def create
    @trip = Trip.find(params[:trip_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.trip = @trip
    respond_to do |format|
      if @review.save
        format.html { redirect_to trip_path(@trip) }
        format.json
      else
        format.html { render "trips/show", status: :unprocessable_entity }
        format.json
      end
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
