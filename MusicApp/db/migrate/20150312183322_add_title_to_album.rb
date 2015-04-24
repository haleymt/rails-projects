class AddTitleToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :title, :string
    add_column :tracks, :song, :string
    change_column :tracks, :song, :string, null: false
    change_column :albums, :title, :string, null: false
  end
end
