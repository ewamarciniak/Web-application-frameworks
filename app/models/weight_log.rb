class WeightLog < ActiveRecord::Base
  attr_accessible :measured_on, :user, :weight, :user_id
  belongs_to :user

  validates :weight, numericality: {greater_than_or_equal_to: 20}
  validates :weight, presence: true
end
