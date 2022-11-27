class TrailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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

      # end
      # @trails = @trails.where(distance: params("Trail::DISTANCE_MAP.values <", Trail::DISTANCE_MAP.keys)))
      # @trails = @trails.where('id', x).where("id < ?", y)
      # @trails = @trails.where('id', x).where("id < ?", y)


    # DISTANCE_MAP =
    # { '0 km to 2 km': { min: 0, max: 2 },
    #   '2 km to 5 km': { min: 2, max: 5 },
    #   '6 km to 100 km': {min: 6, max: 100 }
    # }

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
