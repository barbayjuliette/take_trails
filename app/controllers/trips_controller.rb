class TripsController < ApplicationController
  # GET /trips
  def index
    @trips = Trip.where(user: current_user)
  end

  # POST /trails/:trail_id/trips
  def create
    @trail = Trail.find(params[:trail_id])
    trip_date = DateTime.new(trip_params["date(1i)"].to_i, trip_params["date(2i)"].to_i, trip_params["date(3i)"].to_i, trip_params["date(4i)"].to_i, trip_params["date(5i)"].to_i)
    trip = Trip.new(user: current_user, trail: @trail, date: trip_date)
    if trip.save
      redirect_to trips_path, notice: "Trip created!"
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:date)
  end
end
