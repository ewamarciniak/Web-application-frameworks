class ExerciseLog < ActiveRecord::Base
  attr_accessible :calories_burned, :length, :user_id, :activity_id, :exercise_date
  belongs_to :user
  belongs_to :activity

  validates :activity_id, :exercise_date, :length, :presence => true

  def calculate_calories_burned
      return self.length.present? ? self.activity.calories_burned / 60.0 * self.length : nil
  end
end
