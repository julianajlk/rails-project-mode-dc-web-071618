class Location < ApplicationRecord
  belongs_to :region, optional: true
  has_many :user_characters

  def self.locations_by_region(region)
    Location.all.select { |l| l.region_id == region}
  end

end
