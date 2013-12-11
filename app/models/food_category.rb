class FoodCategory < ActiveRecord::Base
  attr_accessible :name
  before_destroy :check_for_foods
  has_many :foods

  validates :name, :presence => true

  private

  def check_for_foods
    if foods.any?
      self.errors.add :base,"Cannot delete food category while dependant foods exist."
      return false
    end
  end
end
