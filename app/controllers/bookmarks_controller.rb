class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:update, :edit, :destroy]
  def index
    @bookmark = Bookmark.new
    if params[:search]
      @bookmarks = Bookmark.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 4)
    else
      @bookmarks = Bookmark.all.paginate(page: params[:page], per_page: 4)
    end
  end
  def new
    #@bookmark = Bookmark.new
  end
  def create
    @bookmark = current_user.bookmarks.create(bookmark_params)
    redirect_to bookmarks_path
  end
  def update
    if @bookmark.update(bookmark_params)
      redirect_to bookmarks_path
    end
  end

  def edit
  end
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_path}
    end
  end
  private
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
  def bookmark_params
    params.require(:bookmark).permit(:url, :id_user, :screenshot_url, :title)
  end
end
