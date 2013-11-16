class Activity < ActiveRecord::Base
  attr_accessible :calories_burned, :name, :weight
  has_many :exercise_logs
end
