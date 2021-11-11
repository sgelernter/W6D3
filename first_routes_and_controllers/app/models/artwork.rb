class Artwork < ApplicationRecord
    
    validates :title, :image_url, :artist_id, presence: true 
    validates :title, uniqueness: {scope: :artist_id, 
        message: "by that name already created by this artist."}     
   
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
    
    has_many :comments, 
        class_name: :Comment,
        foreign_key: :artwork_id,
        primary_key: :id,
        dependent: :destroy

    has_many :likes, as: :likeable

    has_many :in_collections,
        class_name: :Collection,
        foreign_key: :artwork_id,
        primary_key: :id 

end 