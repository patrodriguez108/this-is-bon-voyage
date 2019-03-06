class Artwork < ApplicationRecord

  has_one_attached :image
  has_many_attached :pages

  def previous
    Artwork.where("id < ?", id).last
  end

  def next
    Artwork.where("id > ?", id).first
  end
end