class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.order(id: :asc)
  end

  def new
    authorize
  end

  def create
    authorize
    @artwork = Artwork.new(artwork_params)

    attach_image

    if @artwork.image.attached? && @artwork.save
      redirect_to artwork_path(@artwork.id)
    else
      render 'new'
    end
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])
  end

  def edit
    @artwork = Artwork.find_by(id: params[:id])
  end

  def update
    @artwork = Artwork.find_by(id: params[:id])
    @artwork.assign_attributes(artwork_params)

    if params[:artwork][:image]
      @artwork.image.purge
      attach_image
    end

    if @artwork.image.attached? && @artwork.save
      redirect_to artwork_path(@artwork.id)
    else
      render 'edit'
    end
  end

  def destroy
    @artwork = Artwork.find_by(id: params[:id])
    @artwork.image.purge
    @artwork.destroy

    redirect_to root_path
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :description)
  end

  def attach_image
    @artwork.image.attach(params[:artwork][:image])
  end
end