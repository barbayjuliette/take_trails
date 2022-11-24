class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user: current_user)

  end

  def create
    @trail = Trail.find(params[:trail_id])
    @bookmark = Bookmark.new(user: current_user, trail: @trail)

    if @bookmark.save
      redirect_to bookmarks_path, notice: "Bookmarked!"
    else
      redirect_to trail_path(@trail), :alert => @bookmark.errors.full_messages[0]
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to trips_path, status: :see_other
  end


end
