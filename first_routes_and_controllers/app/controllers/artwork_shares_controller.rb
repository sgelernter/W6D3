class ArtworkSharesController < ApplicationController

    def create 
        share = ArtworkShare.new(shares_params)
        if share.save
            render json: share 
        else 
            render json: share.errors.full_messages, status: :unprocessable_entity 
        end 
    end
    
    def destroy 
        render json: ArtworkShare.find(params[:id])
        ArtworkShare.destroy(params[:id])
    end 

    private 
    def shares_params 
        params.require(:shares).permit(:artwork_id, :viewer_id)
    end 

end 