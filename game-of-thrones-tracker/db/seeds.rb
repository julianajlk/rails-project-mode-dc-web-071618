# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'

Region.destroy_all
House.destroy_all
Character.destroy_all
User.destroy_all
UserCharacter.destroy_all

api_regions = RestClient.get('https://api.got.show/api/regions/')
regions = JSON.parse(api_regions)

regions.each do |region|
  Region.create(
    name: region["name"]
  )
end

api_houses = RestClient.get('https://api.got.show/api/houses/')
houses = JSON.parse(api_houses)

houses.each do |house|
  House.create(
    name: house["name"],
    coat_of_arms: house["coatOfArms"],
    words: house["words"],
    region: Region.find_by(name: house["region"]),
    founded: house["founded"],
    image_link: house["imageLink"]
  )
end

api_characters = RestClient.get('https://api.got.show/api/characters/')
characters = JSON.parse(api_characters)

characters.each do |character|
  Character.create(
    name: character["name"],
    male: character["male"],
    house: House.find_by(name: character["house"]),
    culture: character["culture"],
    titles: character["titles"],
    image_link: character["imageLink"]
  )
end

user1 = User.create(username: "user1", password: "password1", email: "user1@email.com")
user2 = User.create(username: "user2", password: "password2", email: "user2@email.com")