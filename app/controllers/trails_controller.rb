class TrailsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show toggle_favorite]

  # GET /
  def index
    @trails = Trail.all
    # search bar query
    if params[:query].present?
      @trails = Trail.search_by_name_description_location(params[:query])
    else
      @trails = Trail.all
    end
  end

  # GET /trips
  def show
    @trail = Trail.includes(:reviews).find(params[:id])
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
