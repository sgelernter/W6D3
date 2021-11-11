class Like < ApplicationRecord

    validates :user_id, uniqueness: { scope: [:likeable_id, :likeable_type],
        message: "has already liked that"}

    belongs_to :liker,
        class_name: :User,
        foreign_key: :user_id,
        primary_key: :id 

    belongs_to :likeable, polymorphic: true

end