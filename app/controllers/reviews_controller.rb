class ReviewsController < ApplicationController
  # def index
  #   @trip = Trip.find(params[:trip_id])
  #   @reviews = Review.all
  # end

  def create
    @trip = Trip.find(params[:trip_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.trip = @trip
    review_params[:category_ids][1..].each do |id|
      Tag.new(review: @review, category: Category.find(id.to_i))
    end
    respond_to do |format|
      if @review.save
        format.html { redirect_to trip_path(@trip) }
        format.json
        # do
        #   render json: {
        #     success: true,
        #     review: @review.comment,
        #     # review_tags: [],
        #     rating: @review.rating,
        #     reviewer:  current_user.first_name + " " + current_user.last_name,
        #     created_at: @review.created_at.strftime('%-d %b %Y'),
        #     overall_rating: @review.trip.trail.rating,
        #     review_count: @review.trip.trail.reviews.length
        #   }
        # end
      else
        format.html { render "shared/leavereview", status: :unprocessable_entity }
        format.json do
          render json: {
            success: false
          }
        end
      end
    end
  end

  # def new
  #   @trip = Trip.find(params[:trip_id])
  #   @review = Review.new
  # end

  # def show
  #   @trip = Trip.find(params[:trip_id])
  #   @review = Review.new
  # end
  # def self.tag_counts
  #   Category.joins(reviews: trail).where("trail.id = ?", trip.trail_id)
  #           .group("tags.category_id")
  #           .select("trail.id, categories.*, COUNT(tags.category_id) as count")
  #           .order('count DESC').limit(3)
  # end

  # private

  def review_params
    params.require(:review).permit(:comment, :rating, category_ids: [])
  end
end
