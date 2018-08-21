require 'rails_helper'

describe House do
  let(:the_north) { Region.create(name: "The North") }

  let(:house_stark) {House.create(name: "Stark", region: the_north) }

  let(:jon_snow) { Character.create(name: "Jon Snow", house: house_stark) }

  it 'has a name' do
    expect(house_stark.name).to eq("Stark")
  end

  it 'belongs to a region' do
    expect(house_stark.region.name).to eq("The North")
  end

  it 'has many characters' do
    expect(house_stark.characters).to eq([jon_snow])
  end
end
