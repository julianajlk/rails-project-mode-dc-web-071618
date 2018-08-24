class Region < ApplicationRecord
  has_many :locations
  has_many :houses
  has_many :characters, through: :houses
  has_many :user_characters, through: :location

  def self.has_houses
    all.select {|r| r.houses != []}
  end

  def self.most_houses
    Region.all.sort_by{ |r| r.houses.count}[-3..-1]
  end

  def self.has_locations
    all.select {|r| r.locations != []}
  end

end
