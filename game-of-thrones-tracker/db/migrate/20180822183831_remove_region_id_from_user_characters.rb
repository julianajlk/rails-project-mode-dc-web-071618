class RemoveRegionIdFromUserCharacters < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_characters, :region_id, :integer
  end
end
