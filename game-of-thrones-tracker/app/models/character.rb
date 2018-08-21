class Character < ApplicationRecord
  has_many :user_characters
  has_many :users, through: :user_characters
  belongs_to :house
  belongs_to :region

  serialize :titles, Array

  # include Filterable

  def self.search(search)
    if search
      house = House.find_by(name: search)
      region = Region.find_by(name: search)
      if house
        self.where(house_id: house)
      elsif region
        self.joins(:houses).where(houses: {region_id: region})
      else
        Character.all
      end
    else
      Character.all
    end
  end

end
