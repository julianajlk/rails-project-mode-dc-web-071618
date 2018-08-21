class User < ApplicationRecord
  has_many :user_characters
  has_many :characters, through: :user_characters

  has_secure_password
  validates :username, presence: true, uniqueness:true
end
