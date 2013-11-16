class Food < ActiveRecord::Base
  attr_accessible :calories, :carbohydrates, :cholesterol, :fibre, :name, :protein, :saturated_fats, :sugars, :unsaturated_fats
end
