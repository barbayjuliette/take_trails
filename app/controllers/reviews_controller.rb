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
        format.html { redirect_to trail_path(@trail) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "shared/leavereview", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
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
