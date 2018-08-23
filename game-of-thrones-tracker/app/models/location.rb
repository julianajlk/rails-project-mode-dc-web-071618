class Location < ApplicationRecord
  belongs_to :region, optional: true
  has_many :user_characters

  def self.locations_by_region(region)
    Location.all.select { |l| l.region_id == region}
  end

  def self.known_locations
    Location.all.select { |l| l.name != ""}
  end

  def self.most_characters
    Location.known_locations.sort_by{ |l| l.user_characters.count}[-3..-1]
  end

end
