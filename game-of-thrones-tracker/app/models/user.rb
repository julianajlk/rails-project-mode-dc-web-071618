class User < ApplicationRecord
  has_many :user_characters
  has_many :characters, through: :user_characters
  belongs_to :episode, optional: true

  validates :username, presence: true, uniqueness: true

  has_secure_password

  def locations_with_user_characters
    user_characters.map {|uc| uc.location}.uniq
  end

end
