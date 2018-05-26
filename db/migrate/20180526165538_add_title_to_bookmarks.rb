class AddTitleToBookmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :bookmarks, :title, :string
  end
end
