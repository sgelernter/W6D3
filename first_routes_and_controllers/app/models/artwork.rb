class Artwork < ApplicationRecord
    
    validates :title, :image_url, :artist_id, presence: true 
    validates :title, uniqueness: {scope: :artist_id, 
        message: "This artist already has an artwork by that name."}     
   
    belongs_to :artist, 
        class_name: :User, 
        foreign_key: :artist_id, 
        primary_key: :id 

    has_many :shares, 
        class_name: :ArtworkShare, 
        foreign_key: :artwork_id,
        primary_key: :id 
    
    has_many :shared_viewers,
        through: :shares,
        source: :viewer 

end 