class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.integer :protein
      t.integer :carbohydrates
      t.integer :sugars
      t.integer :saturated_fats
      t.integer :unsaturated_fats
      t.integer :cholesterol
      t.integer :fibre

      t.timestamps
    end
  end
end
