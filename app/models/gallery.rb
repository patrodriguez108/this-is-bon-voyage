class Gallery < ApplicationRecord

  has_one_attached :cover_page
  has_many_attached :images

end