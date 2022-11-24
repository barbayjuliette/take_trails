class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user: current_user)

  end

  def create
    @trail = Trail.find(params[:trail_id])
    bookmark = Bookmark.new(user: current_user, trail: @trail)
    @bookmark.user = current_user
    if bookmark.save
      redirect_to trips_path, notice: "Trip is saved as bookmark!"
    else
      render 'trails/show', locals: {bookmark: bookmark}
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to trips_path
  end


end
