class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :artist
      t.string :museum
      t.string :image
      t.string :user_id

      t.timestamps null: false
    end
  end
end
