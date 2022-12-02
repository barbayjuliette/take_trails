class TrailsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show toggle_favorite]

  def index
    @trails = Trail.all

    if params.dig(:search, :query).present?
      @trails = @trails.search_by_name_description_location(params.dig(:search, :query))
    end

    if params.dig(:search, :difficulties).present?
      @trails = @trails.where(difficulty: params[:search][:difficulties])
    end

    if params.dig(:search, :distance).present?
      distance = params.dig(:search, :distance)
      distance_hash = Trail::DISTANCE_MAP[params.dig(:search, :distance)]
      @trails = @trails.where('distance >= ?', distance_hash[:min])
                       .where("distance <= ?", distance_hash[:max])
    end

    if params.dig(:search, :duration).present?
      duration = params.dig(:search, :duration)
      duration_hash = Trail::DURATION_MAP[params.dig(:search, :duration)]
      @trails = @trails.where('duration >= ?', duration_hash[:min])
                       .where("duration <= ?", duration_hash[:max])
    end
  end

  def create
    @trail = Trail.find(params[:trail_id])
    trip = Trip.new(user: current_user, trail: @trail)
    if trip.save
      redirect_to trips_path, notice: "Trip created!"
    end
  end

  def show
    @trail = Trail.find(params[:id])
    @trip = Trip.new
    @trips = Trip.where(trail: @trail)
    @user_photos = []
    @trips.each do |trip|
      trip.photos.each do |photo|
        @user_photos << photo
      end
    end
    @trailsforecast = weather_forecast(@trail)
  end

  def toggle_favorite
    if user_signed_in?
      @trail = Trail.find(params[:id])
      current_user.favorited?(@trail) ? current_user.unfavorite(@trail) : current_user.favorite(@trail)

      respond_to do |format|
        format.html { render :index }
        format.json { render json: { favourited: current_user.favorited?(@trail), redirect: nil } }
      end
    else
      respond_to do |format|
        format.html { redirect_to new_user_session_path }
        format.json { render json: { favourited: nil, redirect: new_user_session_path } }
      end
    end
  end

  def weather_forecast(trail)
    require "json"
    require "open-uri"

    url_m = "https://maps.googleapis.com/maps/api/geocode/json?address=#{trail.location}&key=AIzaSyAFZzGMoUtW258mKHEh0j5Hz-A6fT7PkZw"
    map_serialized = URI.open(url_m).read
    maps = JSON.parse(map_serialized)
    lat = maps["results"][0]["geometry"]["location"]["lat"]
    lng = maps["results"][0]["geometry"]["location"]["lng"]


    url_w = "http://api.weatherapi.com/v1/forecast.json?key=791c08d9b29546298d073547223011&q&q=#{lat},#{lng}&days=4&aqi=no&alerts=no"
    weather_info = URI.open(url_w).read
    weathers = JSON.parse(weather_info)
    # index = nil
    array_days = []
    start = Date.today-1
    weathers["forecast"]["forecastday"].each do |day|
      min_temp = day["day"]["mintemp_c"]
      max_temp = day["day"]["maxtemp_c"]
      condition = day["day"]["condition"]["text"]
      icon_url = day["day"]["condition"]["icon"]

      array_days << { time: start += 1, min_temp: min_temp, max_temp: max_temp, condition: condition, icon_url: icon_url }
    end
    array_days
  end

end
