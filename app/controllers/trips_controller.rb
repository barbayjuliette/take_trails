class TripsController < ApplicationController
  # GET /trips
  def index
    @trips = Trip.where(user: current_user)
  end

  # POST /trails/:trail_id/trips
  def create
    @trail = Trail.find(params[:trail_id])
    trip = Trip.new(user: current_user, trail: @trail)
    if trip.save
      redirect_to trips_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
