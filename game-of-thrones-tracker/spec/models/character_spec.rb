require 'rails_helper'

describe Character do
  let(:house_stark) { House.create(name: "Stark") }
  let(:jon_snow) { Character.create(name: "Jon Snow", house: house_stark) }

  it 'has a name' do
    expect(jon_snow.name).to eq("Jon Snow")
  end

  it 'belongs to a house' do
    expect(jon_snow.house.name).to eq("Stark")
  end
end
