class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :title
      t.string :link
      t.integer :upvotes
      t.string :category

      t.timestamps null: false
    end
  end
end
