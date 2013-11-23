class ExerciseLog < ActiveRecord::Base
  attr_accessible :calories_burned, :length, :user_id, :activity_id, :exercise_date
  belongs_to :user
  belongs_to :activity

  def calculate_calories_burned
      return self.activity.calories_burned / 60.0 * self.length
  end
end
