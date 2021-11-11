class ArtworksController < ApplicationController

    def index
        render json: Artwork.all
    end

    def create 
        art = Artwork.new(artwork_params)
        if art.save
            render json: art 
        else
            render json: art.errors.full_messages, status: :unprocessable_entity 
        end
    end

    def show 
        render json: Artwork.find(params[:id])
    end

    def update 
        art = Artwork.find(params[:id])
        art.update!(artwork_params)
        render json: art
    end

    def destroy 
        render json: Artwork.find(params[:id])
        Artwork.destroy(params[:id])
    end


    private 

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end


end