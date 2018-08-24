class AddEpisodeIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :episode_id, :integer
  end
end
