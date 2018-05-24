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
    respond_to do |format|
      if @post.save
        format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully created.' }
        format.json { render :index, status: :created, location: bookmarks_url }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to bookmarks_path, notice: 'Bookmark was successfully updated.' }
        format.json { render :index, status: :ok, location: bookmarks_path}
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
  def bookmark_params
    params.require(:bookmark).permit(:url, :id_user, :screenshot_url )
  end
end
