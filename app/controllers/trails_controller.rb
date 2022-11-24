class TrailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /
  def index
    @trails = Trail.all
    # search bar query
    if params[:query].present?
      @trails = Trail.search_by_name_description_location(params[:query])
    else
      @trails =Trail.all
    end
  end

  # GET /trips
  def show
    @trail = Trail.find(params[:id])
    @trip = Trip.new
    render locals: {trip: @trip}
  end
end
