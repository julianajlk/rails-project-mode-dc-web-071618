class House < ApplicationRecord
  has_many :characters
  belongs_to :region, optional: true

  def self.most_characters
    House.all.sort_by{ |h| h.characters.count}[-3..-1]
  end

  def self.longest_words
    House.all.sort_by{ |h| h.words.count}[-1]
  end

  def self.oldest
    House.all.sort_by{ |h| h.founded.to_i}[0]
  end

end
