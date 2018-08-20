class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :coat_of_arms
      t.string :words
      t.integer :region_id
      t.string :founded
      t.string :image_link

      t.timestamps
    end
  end
end
