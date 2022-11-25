class TrailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /
  def index
    @trails = Trail.all

    if params.dig(:search, :difficulties)
      @trails = @trails.where(difficulty: params[:search][:difficulties])
    end

    if params[:query].present?
      @trails = @trails.search_by_name_description_location(params[:query])
    end

    if params[:distance].present?
      @trails = @trails.(params[Trail::DIFFICULTIES])
    end

    # if params["search"].present?
    #   @filter = params["search"]["difficulties"].concat(params["search"]["duration"]).flatten.reject(&:blank?)
    #   @trails = @trails.empty? ? Trail.all :
    #   Trail.all.tagged_with(@filter, any: true)
    # else
    #   @trails = Trail.all
    # end
    # if params[Trail::DIFFICULTIES].present?
    #   @trails = Trail.where(params[Trail::DIFFICULTIES]).distinct
    # # elsif params[:query].present?
    # #   @trails = Trail.search_by_name_description_location(params[:query])
    # else
    #   @trails =Trail.all
    # end

    # if @trails.difficult.present?
    #   @trails = Trail.where(trails.difficulty.key)
    #   #dont use find_by it will return only one record instead of array.
    # else
    #   @trails =Trail.all
    # end

    # @trails = Trail.search(params[:trail])
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
    @bookmark = Bookmark.new
    # render locals: {trip: @trip}
    # render locals: {bookmark: @bookmark}
  end

  # private

  # def distance_map(range)
  #   distance =
  #   { '0-2'  : { min : 0 , max : 2 },
  #     '2-5'   : { min : 3 , max : 5 },
  #     '5-100' : { min : 5 , max : 100 }
  #   }
  #   return distance[range]
  # end

  # def distance_map(range)
  #   distance =
  #   { '0-2': { min: 0, max: 2 },
  #     '2-5': { min: 2, max: 5 }
  #   }

  #   return distance[range]
  # end

  # def self.search(search)
  #   if search
  #     @trails = Trail.all
  #     @trails = @trails.where(difficulty: search[:":difficulty"][","])
  #     # @trails = @trails.where(distance: search[:":distance"][","])
  #     # @trails = @trails.where(duration: search[:":duration"][","])
  #     return @trails
  #   else
  #     @trails =Trail.all
  #   end
  # end

end
