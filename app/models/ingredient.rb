class Ingredient < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :recipes
  before_destroy :check_for_recipes

  validates :name, :presence => true

  private
  #check if dependant recipes logs exist before deleting ingredient
  def check_for_recipes
    recipes = self.recipes.map(&:id)
    if recipes.any?
      self.errors.add :base, "Cannot delete ingredient while dependant recipes exist."
      return false
    end
  end
end