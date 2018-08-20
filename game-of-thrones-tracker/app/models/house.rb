class House < ApplicationRecord
  has_many :characters
  belongs_to :region, optional: true
end
