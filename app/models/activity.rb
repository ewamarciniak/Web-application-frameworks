class Activity < ActiveRecord::Base
  attr_accessible :calories_burned, :name, :weight
  has_many :exercise_logs
  before_destroy :check_for_exercise_logs

  validates :name, :weight, :presence => true

  private

  def check_for_exercise_logs
    require 'debugger'; debugger
    if exercise_logs.any?
      self.errors.add :base,"Cannot delete activity while dependant exercise logs exist."
      return false
    end
  end
end
