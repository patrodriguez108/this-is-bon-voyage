class AddImageToArtworks < ActiveRecord::Migration[5.2]
  def self.up
    add_attachment :artworks, :image
  end

  def self.down
    remove_attachment :artworks, :image
  end
end
