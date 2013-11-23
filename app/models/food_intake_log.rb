class FoodIntakeLog < ActiveRecord::Base
  attr_accessible :amount, :intake_date, :intake_time, :user_id, :food_id, :calories, \
  :carbohydrates, :cholesterol, :fibre, :protein, :saturated_fats, :sugars, :unsaturated_fats

  belongs_to :food
  belongs_to :user

end
