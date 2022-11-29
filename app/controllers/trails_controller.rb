class TrailsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show toggle_favorite]

  # GET /
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
  # GET /trips
  end

  def show
    @trail = Trail.find(params[:id])
    @trip = Trip.new
  end

  def toggle_favorite
    if user_signed_in?
      @trail = Trail.find(params[:id])
      current_user.favorited?(@trail) ? current_user.unfavorite(@trail) : current_user.favorite(@trail)

      respond_to do |format|
        format.html { render :index }
        format.json { render json: current_user.favorited?(@trail).to_json }
      end
    else
      respond_to do |format|
        format.html { redirect_to new_user_session_path }
        format.json { "json response" }
      end
    end
    # @trails = Trail.all
    # render :index
  end
end
