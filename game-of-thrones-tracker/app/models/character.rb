class Character < ApplicationRecord
  has_many :user_characters
  has_many :users, through: :user_characters
  belongs_to :house

  serialize :titles, Array
end
