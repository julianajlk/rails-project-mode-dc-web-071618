class UserCharacter < ApplicationRecord
  belongs_to :character
  belongs_to :user
  belongs_to :house, optional: true
  belongs_to :region, optional: true
  belongs_to :location, optional: true

  enum status: [:unknown, :alive, :dead]

  validates :character_id, presence: true
  validates_uniqueness_of :character_id, scope: [:user_id]

  accepts_nested_attributes_for :location

  def house
    character.house
  end

  def self.find_by_region(region_id)
    region_locations = Location.locations_by_region(region_id)
    location_ids = region_locations.map {|l| l.id}
    UserCharacter.select {|uc| location_ids.include?(uc.location_id)}
  end


end
