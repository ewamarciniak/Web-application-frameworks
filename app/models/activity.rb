class Activity < ActiveRecord::Base
  attr_accessible :calories_burned, :name, :weight
  has_many :exercise_logs

  validates :name, :weight, :presence => true
end
