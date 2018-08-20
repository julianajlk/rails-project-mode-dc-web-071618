class CreateUserCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :user_characters do |t|
      t.integer :character_id
      t.integer :user_id
      t.integer :status, default: 0
      t.integer :location_id
      t.string :note

      t.timestamps
    end
  end
end
