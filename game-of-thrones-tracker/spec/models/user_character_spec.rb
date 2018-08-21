require 'rails_helper'

describe UserCharacter do
  let(:user1) { User.create(username: "user1", password: "password1", email: "user1@email.com") }

  let(:jon_snow) { Character.create(name: "Jon Snow") }

  let(:js1) { UserCharacter.create(user: user1, character: jon_snow) }

  it 'belongs to a user' do
    expect(js1.user.username).to eq("user1")
  end

  it 'belongs to character' do
    expect(js1.character.name).to eq("Jon Snow")
  end
end
