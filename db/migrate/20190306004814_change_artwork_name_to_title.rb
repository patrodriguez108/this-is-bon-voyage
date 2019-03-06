class ChangeArtworkNameToTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :artworks, :name, :title
  end
end
