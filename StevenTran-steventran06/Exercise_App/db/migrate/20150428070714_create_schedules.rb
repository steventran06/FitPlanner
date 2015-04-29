class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :day
      t.string :muscle_group
      t.string :user_id
      t.string :random_exercise

      t.timestamps null: false
    end
  end
end
