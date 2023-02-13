class TripsController < ApplicationController
  # GET /trips
  def index

    @trips = Trip.where(user: current_user)
    @tasks = Task.all

    @upcoming_trips = Trip.where(user: current_user).where('date > ?', Time.now).order('date ASC')
    @past_trips = Trip.where(user: current_user).where('date < ?', Time.now).order('date DESC')

  end

  # POST /trails/:trail_id/trips
  def create
    @trail = Trail.find(params[:trail_id])
    trip_date = DateTime.parse("#{trip_params[:date]} +08:00")
    trip = Trip.new(user: current_user, trail: @trail, date: trip_date)
    if trip.save
      trip.create_checklist(current_user)
      redirect_to trip_path(trip), notice: "Trip created!"
    else
      render 'trails/show', locals: {trip: trip}
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @review = Review.new
    @task = Task.new
    @new_trip = Trip.new
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.photos.attach(photo_params[:photos])
    @count = photo_params[:photos].size

    respond_to do |format|
      if @trip.save
        format.html { redirect_to trip_path(@trip) }
      else
        format.html { render 'trips/show', status: :unprocessable_entity }
      end
      format.json
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:date)
  end

  def photo_params
    params.require(:trip).permit(photos: [])
  end
end
