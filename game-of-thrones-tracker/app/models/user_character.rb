class UserCharacter < ApplicationRecord
  belongs_to :character
  belongs_to :user
  belongs_to :location, optional: true

  enum status: [:unknown, :alive, :dead]

  validates :character_id, presence: true, uniqueness: true
end
