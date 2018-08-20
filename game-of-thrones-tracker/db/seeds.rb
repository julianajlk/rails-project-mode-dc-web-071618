# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Character.destroy_all
User.destroy_all
UserCharacter.destroy_all

jon_snow = Character.create(name: "Jon Snow", gender: "male")
ned_stark = Character.create(name: "Ned Stark", gender: "male")
robb_stark = Character.create(name: "Robb Stark", gender: "male")
catelyn_stark = Character.create(name: "Catelyn Stark", gender: "female")
sansa_stark = Character.create(name: "Sansa Stark", gender: "female")

user1 = User.create(username: "user1", password: "password1", email: "user1@email.com")
user2 = User.create(username: "user2", password: "password2", email: "user2@email.com")

js1 = UserCharacter.create(character_id: jon_snow.id, user_id: user1.id, status: "alive")
js2 = UserCharacter.create(character_id: jon_snow.id, user_id: user2.id, status: "alive")
ns1 = UserCharacter.create(character_id: ned_stark.id, user_id: user1.id)
ns2 = UserCharacter.create(character_id: ned_stark.id, user_id: user2.id)
rs1 = UserCharacter.create(character_id: robb_stark.id, user_id: user1.id)
rs2 = UserCharacter.create(character_id: robb_stark.id, user_id: user2.id)
cs1 = UserCharacter.create(character_id: catelyn_stark.id, user_id: user1.id)
cs2 = UserCharacter.create(character_id: catelyn_stark.id, user_id: user2.id)
