class GalleriesController < ApplicationController
  
  def new
  end

  def create
    gallery = Gallery.new(gallery_params)

    gallery.cover_page.attach(params[:gallery][:cover_page])
    gallery.images.attach(params[:gallery][:images])

    if gallery.cover_page.attached? && gallery.images.attached? && gallery.save
      redirect_to gallery_path(gallery.id)
    end
  end

  def show
    @gallery = Gallery.find_by(id: params[:id])
  end

  private

  def gallery_params
    params.require(:gallery).permit(:title)
  end
end