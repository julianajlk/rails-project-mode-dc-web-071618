class UserCharacter < ApplicationRecord
  belongs_to :character
  belongs_to :user

  enum status: [:unknown, :alive, :dead] 
end
