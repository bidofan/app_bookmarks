class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
  def new
    @bookmark = Bookmark.new
  end
  def create
    @bookmark = current_user.bookmarks.create(bookmark_params)
    if @bookmark.save
      redirect_to bookmarks_path
    end
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to bookmarks_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :id_user, :screenshot_url )
  end
end
