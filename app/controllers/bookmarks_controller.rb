class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user: current_user)

  end

  def create
    @bookmark = Bookmark.find(bookmark_params)
    @bookmark.user = current_user
    if bookmark.save
      redirect_to trips_path, notice: "Trip is saved as bookmark!"
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to trips_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:trail_id, :user_id)
  end

end
