class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:update, :edit, :destroy]
  def index
    @bookmarks = Bookmark.all
  end
  def new
    @bookmark = Bookmark.new
  end
  def create
    @bookmark = current_user.bookmarks.create(bookmark_params)
    redirect_to bookmarks_path
    end
  end
  def update

  end
  def destroy
    @bookmark.destroy

    redirect_to bookmarks_path
  end

  private
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
  def bookmark_params
    params.require(:bookmark).permit(:url, :id_user, :screenshot_url )
  end
end
