class GalleriesController < ApplicationController
  
  def new
    authorize
  end

  def create
    authorize
    @gallery = Gallery.new(gallery_params)

    attach_images

    if @gallery.images.attached? && @gallery.save
      redirect_to gallery_path(@gallery.id)
    end
  end

  def show
    @gallery = Gallery.find_by(id: params[:id])
  end

  def edit
    authorize
    @gallery = Gallery.find_by(id: params[:id])
  end

  def update
    authorize
    @gallery = Gallery.find_by(id: params[:id])
    @gallery.assign_attributes(gallery_params)

    if params[:gallery][:images]
      @gallery.images.purge
      attach_images
    end

    if @gallery.images.attached? && @gallery.save
      redirect_to gallery_path(@gallery.id)
    else
      render 'edit'
    end
  end

  def destroy
    authorize
    @gallery = Gallery.find_by(id: params[:id])
    @gallery.images.purge
    @gallery.destroy

    redirect_to root_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(:title)
  end

  def attach_images
    @gallery.images.attach(params[:gallery][:images])
  end
end