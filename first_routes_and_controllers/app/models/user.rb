class User < ApplicationRecord 


    validates :username, presence: true, uniqueness: true 

    has_many :artworks, 
        class_name: :Artwork,
        foreign_key: :artist_id,
        primary_key: :id,
        dependent: :destroy 

    has_many :shares, 
        class_name: :ArtworkShare, 
        foreign_key: :viewer_id, 
        primary_key: :id,
        dependent: :destroy

    has_many :shared_with_me, 
        through: :shares, 
        source: :artwork
        
end