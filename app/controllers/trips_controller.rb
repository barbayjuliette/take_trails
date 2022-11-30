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

  def weather_forecast
    # query the api from here
    # https://api.openweathermap.org/data/2.5/weather?lat=1.3906746&lon=103.9883041&appid=6157d0b45dbc65d57d7bcb4569934b10

    require "json"
    require "open-uri"

    @apiKey = ENV["API_KEY"]
    url = 'https://api.openweathermap.org/data/2.5/weather?' + location + '&appid=' + @apiKey
    weather_info = URI.open(url).read
    weathers = JSON.parse(weather_info)
    weathers.each do |weather|
      temp_min= weather["temp_min"],
      temp_max= weather["temp_max"],
      icon= weather["icon"],
      main= weather["main"],
      description= weather["description"]
    end
    # pass the data into a partial, which returns html as text
    # respond_to do |format|
    #   format.html { redirect_to  trip_path(trip) }
    #   format.text { render partial: "shared/weather", locals: {trip: trip}, formats: [:html] }
  end

  private

  def trip_params
    params.require(:trip).permit(:date)
  end
end
