class Region < ApplicationRecord
  has_many :houses
  has_many :user_characters
  has_many :characters, through: :houses
end
