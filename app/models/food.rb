class Food < ActiveRecord::Base
  attr_accessible :calories, :carbohydrates, :cholesterol, :fibre, :name, :protein, :saturated_fats, :sugars, :unsaturated_fats

  has_many :food_intake_logs
end
