class RemoveWeightFromActivities < ActiveRecord::Migration
  def up
    remove_column :activities, :weight
  end

  def down
    add_column :activities, :weight, :integer
  end
end
