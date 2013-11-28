# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131127204805) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.integer  "weight"
    t.integer  "calories_burned"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "exercise_logs", :force => true do |t|
    t.integer  "length"
    t.integer  "calories_burned"
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.date     "exercise_date"
  end

  add_index "exercise_logs", ["activity_id"], :name => "index_exercise_logs_on_activity_id"
  add_index "exercise_logs", ["user_id"], :name => "index_exercise_logs_on_user_id"

  create_table "food_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "food_intake_logs", :force => true do |t|
    t.date     "intake_date"
    t.time     "intake_time"
    t.integer  "food_id"
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.decimal  "calories"
    t.decimal  "carbohydrates"
    t.decimal  "cholesterol"
    t.decimal  "fibre"
    t.decimal  "protein"
    t.decimal  "saturated_fats"
    t.decimal  "unsaturated_fats"
    t.decimal  "sugars"
  end

  add_index "food_intake_logs", ["food_id"], :name => "index_food_intake_logs_on_food_id"
  add_index "food_intake_logs", ["user_id"], :name => "index_food_intake_logs_on_user_id"

  create_table "foods", :force => true do |t|
    t.string   "name"
    t.decimal  "calories"
    t.decimal  "protein"
    t.decimal  "carbohydrates"
    t.decimal  "sugars"
    t.decimal  "saturated_fats"
    t.decimal  "unsaturated_fats"
    t.decimal  "cholesterol"
    t.decimal  "fibre"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "food_category_id"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ingredients_recipes", :id => false, :force => true do |t|
    t.integer "ingredient_id"
    t.integer "recipe_id"
  end

  create_table "motivational_images", :force => true do |t|
    t.string   "caption"
    t.integer  "user_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "gender"
    t.boolean  "pregnant"
    t.boolean  "brestfeeding"
    t.integer  "height"
    t.date     "dob"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "title"
    t.text     "directions"
    t.integer  "cooking_time"
    t.integer  "preparation_time"
    t.integer  "calories_per_portion"
    t.integer  "number_of_portions"
    t.text     "shopping_list"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "weight_logs", :force => true do |t|
    t.decimal  "weight"
    t.date     "measured_on"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
