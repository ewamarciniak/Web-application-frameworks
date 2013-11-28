class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :gender
      t.boolean :pregnant
      t.boolean :brestfeeding
      t.integer :height
      t.date :dob

      t.timestamps
    end
  end
end
