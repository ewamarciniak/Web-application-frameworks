class Ingredient < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :recipes
  before_destroy :check_for_recipes

  validates :name, :presence => true

  private

  def check_for_recipes
    if recipes.any?
      self.errors.add :base,"Cannot delete ingredient while dependant recipes exist."
      return false
    end
  end
end
