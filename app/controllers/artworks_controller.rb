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

  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :description)
  end

  def attach_image
    @artwork.image.attach(params[:artwork][:image])
  end
end