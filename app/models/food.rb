class Food < ActiveRecord::Base
  attr_accessible :calories, :carbohydrates, :cholesterol,\
   :fibre, :name, :protein, :saturated_fats, :sugars, \
   :food_category_id, :unsaturated_fats

  has_many :food_intake_logs
  belongs_to :food_category
  validates :exercise_date, :presence => true
end
