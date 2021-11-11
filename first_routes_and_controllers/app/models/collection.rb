class Collection < ApplicationRecord 

    validates :name, uniqueness: {scope: [:user_id, :artwork_id], 
        message: "already has this artwork"}

    belongs_to :user, 
    class_name: :User, 
    foreign_key: :user_id,
    primary_key: :id 

    belongs_to :artwork, 
    class_name: :Artwork, 
    foreign_key: :artwork_id, 
    primary_key: :id 

    
end