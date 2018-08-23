class Location < ApplicationRecord
  belongs_to :region, optional: true
  has_many :user_characters

end
