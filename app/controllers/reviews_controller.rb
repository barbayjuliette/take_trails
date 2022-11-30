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
        format.html { redirect_to trail_path(@trail) }
        format.json do
          render json: {
            success: true,
            review: @review.comment,
            review_tags: @review.categories.map { |category| category.name },
            rating: @review.rating,
            reviewer:  current_user.first_name + " " + current_user.last_name,
            created_at: @review.created_at.to_s.split(" ").first
          }
        end
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

  # private

  def review_params
    params.require(:review).permit(:comment, :rating, category_ids: [])
  end
end
