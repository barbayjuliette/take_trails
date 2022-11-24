class TripsController < ApplicationController
  # GET /trips
  def index
    @trips = Trip.where(user: current_user)
  end

  # POST /trails/:trail_id/trips
  def create
    @trail = Trail.find(params[:trail_id])
    trip_date = DateTime.parse("#{trip_params[:date]} +08:00")
    trip = Trip.new(user: current_user, trail: @trail, date: trip_date)
    if trip.save
      redirect_to trips_path, notice: "Trip created!"
    else
      render 'trails/show', locals: {trip: trip}
    end
  end

  def show
  end

  private

  def trip_params
    params.require(:trip).permit(:date)
  end
end
