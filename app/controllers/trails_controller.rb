class TrailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /
  def index
    @trails = Trail.all
    # search bar query
    if params[:query].present?
      @trails = Trail.where(name: params[:query])
    else
      @trails =Trail.all
    end
  end

  # GET /trips
  def show
    @trail = Trail.find(params[:id])
    @trip = Trip.new
  end
end
