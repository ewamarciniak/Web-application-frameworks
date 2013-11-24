class CreateMotivationalImages < ActiveRecord::Migration
  def change
    create_table :motivational_images do |t|
      t.string :caption
      t.references :user
      t.attachment :picture

      t.timestamps
    end
  end
end

