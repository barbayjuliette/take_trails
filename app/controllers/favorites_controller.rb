class FavoritesController < ApplicationController
  def index
    @user = current_user
    # @trails = @user.all_favorites
    @alltrails = Trail.all
    @trails = []
    @alltrails.each do |trail|
      if @user.favorited?(trail)
        @trails << trail
      end
    end
  end
end
