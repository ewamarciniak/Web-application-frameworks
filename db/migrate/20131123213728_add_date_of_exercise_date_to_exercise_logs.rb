class AddDateOfExerciseDateToExerciseLogs < ActiveRecord::Migration
  def change
    add_column :exercise_logs, :exercise_date, :date
  end
end
