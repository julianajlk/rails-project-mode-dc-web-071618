class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :name
      t.integer :season
      t.integer :season_episode_number
      t.integer :total_episode_number
      t.string :director
      t.date :air_date
      t.text :characters, array: true
      t.string :previous_episode
      t.string :next_episode

      t.timestamps
    end
  end
end
