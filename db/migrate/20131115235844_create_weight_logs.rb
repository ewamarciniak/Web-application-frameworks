class CreateWeightLogs < ActiveRecord::Migration
  def change
    create_table :weight_logs do |t|
      t.decimal :weight
      t.date :measured_on
      t.references :user

      t.timestamps
    end
  end
end
