# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Region.destroy_all
House.destroy_all
Location.destroy_all
Character.destroy_all
User.destroy_all
UserCharacter.destroy_all


region_north = Region.create(name: "The North")

house_stark = House.create(name: "Stark", region: region_north)

location = Location.create(name: "Winterfell", region: region_north)

jon_snow = Character.create(name: "Jon Snow", male: true, house: house_stark)
ned_stark = Character.create(name: "Ned Stark", male: true, house: house_stark)
robb_stark = Character.create(name: "Robb Stark", male: true, house: house_stark)
catelyn_stark = Character.create(name: "Catelyn Stark", male: false, house: house_stark)
sansa_stark = Character.create(name: "Sansa Stark", male: false, house: house_stark)

user1 = User.create(username: "user1", password: "password1", email: "user1@email.com")
user2 = User.create(username: "user2", password: "password2", email: "user2@email.com")

js1 = UserCharacter.create(character: jon_snow, user: user1, status: "alive", location: location)
js2 = UserCharacter.create(character_id: jon_snow.id, user_id: user2.id, status: "alive", location: nil)
ns1 = UserCharacter.create(character_id: ned_stark.id, user_id: user1.id)
ns2 = UserCharacter.create(character_id: ned_stark.id, user_id: user2.id)
rs1 = UserCharacter.create(character_id: robb_stark.id, user_id: user1.id)
rs2 = UserCharacter.create(character_id: robb_stark.id, user_id: user2.id)
cs1 = UserCharacter.create(character_id: catelyn_stark.id, user_id: user1.id)
cs2 = UserCharacter.create(character_id: catelyn_stark.id, user_id: user2.id)

#Locations
