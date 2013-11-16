class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :weight
      t.integer :calories_burned

      t.timestamps
    end
  end
end
