class ArtworksController < ApplicationController

  def index
  end

  def new
  end

  def create
    artwork = Artwork.new(artwork_params)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :description)
  end
end