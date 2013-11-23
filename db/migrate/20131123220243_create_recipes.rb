class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :directions
      t.integer :cooking_time
      t.integer :preparation_time
      t.integer :calories_per_portion
      t.integer :number_of_portions
      t.text :shopping_list

      t.timestamps
    end
  end
end
