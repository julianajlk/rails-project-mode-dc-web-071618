class Region < ApplicationRecord
  has_many :houses
  has_many :characters, through: :houses
  has_many :user_characters, through: :characters

  def self.has_houses
    all.select {|r| r.houses != []}
  end

end
