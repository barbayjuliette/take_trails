class TrailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /
  def index
      # params[:search].present?
      # pp params[:search]
    if pp params[:search][:difficulty_levels]
      ..
    end
#  or
    if params.dig(:search, :difficulty_levels)
      @trails = Trail.where(params [:difficulty])
    end




    @trails = Trail.all
    # search bar query
    if params[:query].present?
      @trails = Trail.search_by_name_description_location(params[:query])
    else
      @trails =Trail.all
    end

    # if params[:difficulty].present?
    #   @trails = Trail.where(params [:difficulty])
    # else
    #   @trails = Trail.all
    # end


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
  end


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
