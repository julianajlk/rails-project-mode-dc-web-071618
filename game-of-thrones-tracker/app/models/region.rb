class Region < ApplicationRecord
  has_many :houses
  has_many :locations
end
