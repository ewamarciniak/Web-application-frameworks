class Recipe < ActiveRecord::Base
  attr_accessible :calories_per_portion, :cooking_time, :directions, :integer, \
  :number_of_portions, :preparation_time, :shopping_list, :text, :title, :ingredient_ids
  has_and_belongs_to_many :ingredients

  def ready_in_time
    return self.preparation_time + self.cooking_time
  end
end
