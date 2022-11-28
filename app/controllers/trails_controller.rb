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
    else

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
    # search bar query
  #   if params[:query].present?
  #     @trails = Trail.search_by_name_description_location(params[:query])
  #   else
  #     @trails = Trail.all
  #   end
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
    # @bookmark = Bookmark.new
    # render locals: {trip: @trip}
    # render locals: {bookmark: @bookmark}
  end

  def toggle_favorite
    if user_signed_in?
      @trail = Trail.find(params[:id])
      current_user.favorited?(@trail) ? current_user.unfavorite(@trail) : current_user.favorite(@trail)
    else
      redirect_to new_user_session_path
    end
  end
end
