class Activity < ActiveRecord::Base
  attr_accessible :calories_burned, :name, :weight
  has_many :exercise_logs
  before_destroy :check_for_exercise_logs

  validates :name, :weight, :presence => true

  private
  #check if dependant exercise logs exist before deleting activity
  def check_for_exercise_logs
    exercise_logs = ExerciseLog.where(:activity_id => self.id)
    if exercise_logs.any?
      self.errors.add :base, "Cannot delete activity while dependant exercise logs exist."
      return false
    end
  end
end