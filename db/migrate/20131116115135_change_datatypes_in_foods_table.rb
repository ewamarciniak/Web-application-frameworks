class ChangeDatatypesInFoodsTable < ActiveRecord::Migration
  def up
    change_column :foods, :calories, :decimal
    change_column :foods, :protein, :decimal
    change_column :foods, :carbohydrates, :decimal
    change_column :foods, :sugars, :decimal
    change_column :foods, :saturated_fats, :decimal
    change_column :foods, :unsaturated_fats, :decimal
    change_column :foods, :cholesterol, :decimal
    change_column :foods, :fibre, :decimal
  end

  def down
    change_column :foods, :calories, :integer
    change_column :foods, :protein, :integer
    change_column :foods, :carbohydrates, :integer
    change_column :foods, :sugars, :integer
    change_column :foods, :saturated_fats, :integer
    change_column :foods, :unsaturated_fats, :integer
    change_column :foods, :cholesterol, :integer
    change_column :foods, :fibre, :integer
  end
end
