class AddLocationIdToUserCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :user_characters, :location_id, :integer
  end
end
