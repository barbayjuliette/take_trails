class TrailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /
  def index
    @trails = Trail.all
  end

  # GET /trips
  def show
    @trail = Trail.find(params[:id])
    @trip = Trip.new
    render locals: {trip: @trip}
  end
end
