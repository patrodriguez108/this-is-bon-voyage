class Gallery < ApplicationRecord

  has_many_attached :images

  def previous
    Gallery.where("id < ?", id).last
  end

  def next
    Gallery.where("id > ?", id).first
  end

  def cover_image
    images.first
  end
end