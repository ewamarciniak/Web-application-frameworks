class FoodIntakeLog < ActiveRecord::Base
  attr_accessible :amount, :intake_date, :intake_time, :user_id, :food_id
  belongs_to :food
  belongs_to :user

end
