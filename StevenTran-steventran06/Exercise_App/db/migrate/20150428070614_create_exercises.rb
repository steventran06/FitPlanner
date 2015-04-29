class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :exercise
      t.string :main_muscle_worked
      t.string :exercise_type
      t.string :equipment
      t.string :force
      t.string :mechanics_type
      t.text :guide
      t.string :level
      t.string :link
      t.string :other_muscles_worked
      t.string :picture
      t.string :user_id

      t.timestamps null: false
    end
  end
end
