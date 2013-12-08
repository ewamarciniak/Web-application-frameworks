class FoodCategory < ActiveRecord::Base
  attr_accessible :name

  has_many :foods

  validates :name, :presence => true
end
