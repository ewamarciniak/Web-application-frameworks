class Food < ActiveRecord::Base
  attr_accessible :calories, :carbohydrates, :cholesterol,:fibre, :name, :protein, :saturated_fats, :sugars, \
   :food_category_id, :unsaturated_fats
  before_destroy :check_for_food_intake_logs

  has_many :food_intake_logs
  belongs_to :food_category
  validates :exercise_date, :presence => true

  private
  #check if dependant food intake logs exist before deleting food
  def check_for_food_intake_logs
    food_intake_logs = FoodIntakeLog.where(:food_id => self.id)
    if food_intake_logs.any?
      self.errors.add :base,"Cannot delete food while dependant food intake logs exist."
      return false
    end
  end
end