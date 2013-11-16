class CreateExerciseLogs < ActiveRecord::Migration
  def change
    create_table :exercise_logs do |t|
      t.integer :length
      t.integer :calories_burned
      t.references :user
      t.references :activity

      t.timestamps
    end
    add_index :exercise_logs, :user_id
    add_index :exercise_logs, :activity_id
  end
end
