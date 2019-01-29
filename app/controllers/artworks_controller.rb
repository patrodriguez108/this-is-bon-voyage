class ArtworksController < ApplicationController

  def index
  end

  def new
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
      redirect_to artwork_path(artwork.id)
    else
      @errors = artwork.errors.full_messages
      render 'new'
    end
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :description, :image)
  end
end