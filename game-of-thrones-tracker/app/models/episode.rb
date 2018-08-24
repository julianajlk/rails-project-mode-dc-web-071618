class Episode < ApplicationRecord
  has_many :users

  serialize :characters, Array

  def self.most_popular
    Episode.all.sort_by { |e| e.users.count }[-3..-1]
  end

  def self.sort_episodes
    Episode.order(:total_episode_number)
  end

end
