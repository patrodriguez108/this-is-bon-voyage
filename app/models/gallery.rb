class Gallery < ApplicationRecord

  has_one_attached :cover_page
  has_many_attached :images

  def previous
    Gallery.where("id < ?", id).last
  end

  def next
    Gallery.where("id > ?", id).first
  end

end