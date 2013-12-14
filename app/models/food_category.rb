class FoodCategory < ActiveRecord::Base
  attr_accessible :name
  before_destroy :check_for_foods
  has_many :foods

  validates :name, :presence => true

  private
  #check if dependant foods exist before deleting food category
  def check_for_foods
    foods = Food.where(:food_category_id => self.id)
    if foods.any?
      self.errors.add :base,"Cannot delete food category while dependant foods exist."
      return false
    end
  end
end