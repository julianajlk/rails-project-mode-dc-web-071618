class Character < ApplicationRecord
  has_many :user_characters
  has_many :users, through: :user_characters
  belongs_to :house, optional: true
  belongs_to :region, optional: true

  serialize :titles, Array

  def self.characters_by_region(region)
    Character.select { |c| c.house.region == region }
  end

  def self.most_popular
    Character.all.sort_by { |c| c.user_characters.count}[-5..-1]
  end

  def self.most_titles
    Character.all.sort_by { |c| c.titles.count}[-1]
  end


  def self.search(search)
    if search
      character = Character.find_by(name: search)
      if character
        [character]
      else
        house = House.find_by(name: search)
        if house
          where(house_id: house)
        else
          region = Region.find_by(name: search)
          if region
            characters_by_region(region)
          end
        end
      end
    end
  end


end
