class ArtworkShare  < ApplicationRecord

    validates :artwork_id, :viewer_id, presence: true 
    validates :artwork_id, uniqueness: {scope: :viewer_id, 
        message: "has already been shared with this user."}

    belongs_to :artwork, 
        class_name: :Artwork, 
        foreign_key: :artwork_id, 
        primary_key: :id 

    belongs_to :viewer, 
        class_name: :User, 
        foreign_key: :viewer_id, 
        primary_key: :id

end 