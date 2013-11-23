class AddFoodCategoryRefToFoods < ActiveRecord::Migration
  def change
    change_table :foods do |t|
      t.references :food_category
    end
  end
end
