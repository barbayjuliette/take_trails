class TripsController < ApplicationController
  # GET /trips
  def index
    @upcoming_trips = Trip.where(user: current_user).where('date > ?', Time.now).order('date ASC')
    @past_trips = Trip.where(user: current_user).where('date < ?', Time.now).order('date DESC')
  end

  # POST /trails/:trail_id/trips
  def create
    @trail = Trail.find(params[:trail_id])
    trip_date = DateTime.parse("#{trip_params[:date]} +08:00")
    trip = Trip.new(user: current_user, trail: @trail, date: trip_date)
    if trip.save
      redirect_to trip_path(trip), notice: "Trip created!"
    else
      render 'trails/show', locals: {trip: trip}
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @review = Review.new
  end

  def update
    @trip = Trip.find(params[:id])
    @restaurant.update(trip_params_add_photos)
  end

  private

  def trip_params
    params.require(:trip).permit(:date)
  end

  def trip_params_add_photos
    params.require(:trip).permit(photos: [])
  end

end
