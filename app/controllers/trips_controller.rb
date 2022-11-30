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
    @forecast = weather_forecast(@trip)
  end

  def weather_forecast(trip)
    # query the api from here
    # https://api.openweathermap.org/data/2.5/weather?lat=1.3906746&lon=103.9883041&appid=6157d0b45dbc65d57d7bcb4569934b10

    require "json"
    require "open-uri"

    url_m = "https://maps.googleapis.com/maps/api/geocode/json?address=#{trip.trail.location}&key=AIzaSyAFZzGMoUtW258mKHEh0j5Hz-A6fT7PkZw"
    map_serialized = URI.open(url_m).read
    maps = JSON.parse(map_serialized)
    lat = maps["results"][0]["geometry"]["location"]["lat"]
    lng = maps["results"][0]["geometry"]["location"]["lng"]


    url_w = "http://api.weatherapi.com/v1/forecast.json?key=791c08d9b29546298d073547223011&q=#{lat},#{lng}&days=4&aqi=no&alerts=no"
    weather_info = URI.open(url_w).read
    weathers = JSON.parse(weather_info)
    index = nil
    weathers["forecast"]["forecastday"].each_with_index do |day, i|
      if day["date"] == trip.date.strftime('%Y-%m-%d')
        index = i
        break
      end
    end
    if index
      min_temp = weathers["forecast"]["forecastday"][index]["day"]["mintemp_c"]
      max_temp = weathers["forecast"]["forecastday"][index]["day"]["maxtemp_c"]
      condition = weathers["forecast"]["forecastday"][index]["day"]["condition"]["text"]
      icon_url = weathers["forecast"]["forecastday"][index]["day"]["condition"]["icon"]
      return { min_temp: min_temp, max_temp: max_temp, condition: condition, icon_url: icon_url }
    else
      return false
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:date)
  end
end
