class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
  def new
    @bookmark = Bookmark.new
  end
  def create
    @bookmark = current_user.bookmarks.create(bookmark_params)
  end
  def destroy
    @bookmark.destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :id_user, :screenshot_url )
  end
end
