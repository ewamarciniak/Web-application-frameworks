class AddCaloriesToFoodIntakeLogs < ActiveRecord::Migration
  def change
    add_column :food_intake_logs, :calories, :decimal
    add_column :food_intake_logs, :carbohydrates, :decimal
    add_column :food_intake_logs, :cholesterol, :decimal
    add_column :food_intake_logs, :fibre, :decimal
    add_column :food_intake_logs, :protein, :decimal
    add_column :food_intake_logs, :saturated_fats, :decimal
    add_column :food_intake_logs, :unsaturated_fats, :decimal
    add_column :food_intake_logs, :sugars, :decimal
  end
end
