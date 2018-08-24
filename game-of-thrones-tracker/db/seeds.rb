# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'

Region.destroy_all
Location.destroy_all
House.destroy_all
Character.destroy_all
User.destroy_all
UserCharacter.destroy_all

api_regions = RestClient.get('https://api.got.show/api/regions/')
regions = JSON.parse(api_regions)

regions.each do |region|
  duplicates = ["The North", "The Crownlands", "Red waste", "The Westerlands", "The Riverlands", "The Reach", "The Stormlands", "Others", "The Vale"]
  if duplicates.exclude?(region["name"])
    Region.create(
      name: region["name"]
    )
  end
end

locations = [
  {name: "Winterfell", region: "North", description: "a castle that is the seat of House Stark"},
  {name: "Eyrie", region: "Vale of Arryn", description: "a castle that is considered impregnable to attack and is the seat of House Arryn"},
  {name: "King's Landing", region: "Crownlands", description: "the capital of the Seven Kingdoms"},
  {name: "Pentos", region: "Free Cities", description: "a large, rich city-state of merchant lords located on the western coastline of Essos"},
  {name: "Castle Black", region: "North", description: "the primary headquarters of the Night's Watch, located roughly halfway along the length of the Wall on its southern side"},
  {name: "Moat Cailin", region: "North", description: "a ruined collection of towers, vital for the North's defense"},
  {name: "Riverrun", region: "Riverlands", description: "a large castle that is the seat of House Tully"},
  {name: "Kingsroad", description: "the longest highway in the Seven Kingdoms, running from Castle Black to King's Landing"},
  {name: "Crossroads Inn", region: "Riverlands", description: "a popular stop for travelers on the Kingsroad, lies of the meeting points of major roads"},
  {name: "Vaes Dothrak", region: "Dothraki sea", description: "a Dothraki trading city where it if forbidden to draw a sword"},
  {name: "Casterly Rock", region: "Westerlands", description: "ancestral stronghold of House Lannister, located on the Western coast of Westeros"}
  ]

locations.each do |location|
  Location.create(
    name: location[:name],
    description: location[:description],
    region: Region.find_by(name: location[:region])
  )
end

api_houses = RestClient.get('https://api.got.show/api/houses/')
houses = JSON.parse(api_houses)

houses.each do |house|
  case house["region"]
  when "The North"
    region = "North"
  when "The Westerlands"
    region = "Westerlands"
  when "The Reach"
    region = "Reach"
  when "The Vale"
    region = "Vale of Arryn"
  else
    region = house["region"]
  end
  if house["name"] != "Henly (House Ashford)" && house["name"] != "Norren (House Mooton)"
    House.create(
      name: house["name"],
      coat_of_arms: house["coatOfArms"],
      words: house["words"],
      region: Region.find_by(name: region),
      founded: house["founded"],
      image_link: house["imageLink"]
    )
  end
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

user1 = User.create(username: "user1", email: "user1@email.com", password: "password1")
user2 = User.create(username: "user2", email: "user2@email.com", password: "password2")
