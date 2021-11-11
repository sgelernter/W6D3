class CommentsController < ApplicationController

    def index 
        if params[:user_id]
            user = User.find(params[:user_id])
            render json: user.comments.as_json
        else
            artwork = Artwork.find(params[:artwork_id])
            render json: artwork.comments.as_json
        end
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save 
            render json: comment 
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        render json: comment 
        comment.destroy
    end

    private 

    def comment_params
        params.require(:comment).permit(:artwork_id, :user_id, :body)
    end

end