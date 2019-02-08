class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.all
  end

  def new
  end

  def create
    artwork = Artwork.new(artwork_params)

    artwork.image.attach(params[:artwork][:image])
    if artwork.image.attached? && artwork.save
      redirect_to artwork_path(artwork.id)
    else
      render 'new'
    end
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :description)
  end
end