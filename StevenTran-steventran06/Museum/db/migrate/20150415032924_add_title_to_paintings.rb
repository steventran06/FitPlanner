class AddTitleToPaintings < ActiveRecord::Migration
  def change
  	 add_column :paintings, :title, :string
  end
end
