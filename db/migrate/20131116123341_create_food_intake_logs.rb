class CreateFoodIntakeLogs < ActiveRecord::Migration
  def change
    create_table :food_intake_logs do |t|
      t.date :intake_date
      t.time :intake_time
      t.references :food
      t.integer :amount
      t.references :user

      t.timestamps
    end
    add_index :food_intake_logs, :food_id
    add_index :food_intake_logs, :user_id
  end
end
