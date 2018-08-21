require 'rails_helper'

describe User do
  let(:user1) { User.create(username: "user1", password: "password1", email: "user1@email.com") }

  it 'has a username' do
    expect(user1.username).to eq("user1")
  end

  it 'has a password' do
    expect(user1.password).to eq("password1")
  end

  it 'has an email' do
    expect(user1.email).to eq("user1@email.com")
  end
end
