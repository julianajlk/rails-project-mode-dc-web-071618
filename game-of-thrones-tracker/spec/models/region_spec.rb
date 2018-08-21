require 'rails_helper'

describe Region do
  let(:the_north) { Region.create(name: "The North") }

  let(:house_stark) {House.create(name: "Stark", region: the_north) }

  it 'has a name' do
    expect(the_north.name).to eq("The North")
  end

  it 'has many houses' do
    expect(the_north.houses).to eq([house_stark])
  end
end
