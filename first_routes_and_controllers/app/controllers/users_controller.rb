class UsersController < ApplicationController 

    def index
        if params.keys.length == 3 
            search = params.values.select{ |value| value != "users" && value != "index"}
            search_term = "%#{search.first}%"
            render json: User.where("UPPER(username) LIKE UPPER('#{search_term}')")
        else 
            render json: User.all
        end 
    end

    def create 
        user = User.new(user_params)
        if user.save
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity 
        end 
    end 

    def show
        render json: User.find(params[:id])
    end 

    def update 
        user = User.find(params[:id])
        user.update!(user_params)
        render json: user
    end 

    def destroy 
        render json: User.find(params[:id]) 
        User.destroy(params[:id])
    end 

    def favorite 
        #artwork_id, ownership_tag(artwork/share)
        user = User.find(params[:id])
        if params[:ownership] 
            art = Artwork.find(params[:artwork_id])
        else
            art = ArtworkShares.find(params[:artwork_id])
        end 

        art.favorite ? art.update!(favorite: false) : art.update!(favorite: true)
        render json: art
        # Artwork.joins(:shares).where('artworks.favorite = true OR artwork_shares.favorite = true').as_json
    end 

    private 

    def user_params 
        params.require(:user).permit(:username)
    end 

end