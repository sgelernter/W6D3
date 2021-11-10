# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all 
ArtworkShare.destroy_all 

user_1 = User.create!(username: 'Picasso')
user_2 = User.create!(username: 'Monet')
user_3 = User.create!(username: 'O''Keefe')
user_4 = User.create!(username: 'Kandinsky')
user_5 = User.create!(username: 'Hirst')

art_1 = Artwork.create!(title: 'Guernica', image_url: 'whatever.com', artist_id: user_1.id)
art_2 = Artwork.create!(title: 'Water Lillies', image_url: 'whocares.gov', artist_id: user_2.id)
art_3 = Artwork.create!(title: 'Something with Flowers', image_url: 'notme.biz', artist_id: user_3.id)
art_4 = Artwork.create!(title: 'These are cool shapes', image_url: 'whatever2.thesequel', artist_id: user_4.id)
art_5 = Artwork.create!(title: 'Dead Shark', image_url: 'deadshark.com', artist_id: user_5.id)

ArtworkShare.create!(viewer_id: user_1.id, artwork_id: art_3.id)
ArtworkShare.create!(viewer_id: user_1.id, artwork_id: art_4.id)
ArtworkShare.create!(viewer_id: user_2.id, artwork_id: art_2.id)
ArtworkShare.create!(viewer_id: user_3.id, artwork_id: art_2.id)
ArtworkShare.create!(viewer_id: user_2.id, artwork_id: art_5.id)



