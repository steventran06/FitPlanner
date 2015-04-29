class ChangeDayToString < ActiveRecord::Migration
  def change
  	change_column :schedules, :day, :string
  end
end
