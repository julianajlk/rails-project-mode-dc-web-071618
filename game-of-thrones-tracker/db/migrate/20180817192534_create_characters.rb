class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.boolean :male
      t.integer :house_id
      t.string :culture
      t.text :titles, array: true
      t.string :image_link

      t.timestamps
    end
  end
end
