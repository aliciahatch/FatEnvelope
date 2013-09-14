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

ActiveRecord::Schema.define(:version => 20130914182749) do

  create_table "admins", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "appointments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "student_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
    t.date     "date"
    t.integer  "hour"
  end

  create_table "bootcamps", :force => true do |t|
    t.date     "bootcamp_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "payments", :force => true do |t|
    t.string   "status"
    t.float    "amount"
    t.string   "email"
    t.string   "transaction_number"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.decimal  "price"
    t.integer  "numofschools"
  end

  create_table "program_manifests", :force => true do |t|
    t.integer  "step_id"
    t.integer  "program_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "program_manifest_id"
  end

  create_table "registrations", :force => true do |t|
    t.string   "program"
    t.integer  "price"
    t.integer  "user_id"
    t.date     "bootcamp_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "registrations", ["user_id"], :name => "index_registrations_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "state"
    t.string   "zip"
    t.date     "admission_deadline"
    t.integer  "ranking"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.text     "image"
    t.string   "essayprompt"
    t.integer  "essaylength"
    t.datetime "essayduedate"
    t.integer  "program_id"
    t.string   "completed_steps"
  end

  create_table "schools_users", :force => true do |t|
    t.integer "school_id"
    t.integer "user_id"
  end

  create_table "step_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "steps", :force => true do |t|
    t.string   "name"
    t.integer  "step_type_id"
    t.text     "instructions"
    t.string   "video_mp4"
    t.string   "video_webm"
    t.boolean  "writing_area"
    t.integer  "points"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "program_manifest_id"
    t.integer  "sortorder"
    t.string   "video_poster"
    t.text     "sidebarcontent"
    t.boolean  "sidebarcontentbool"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "plan_id"
    t.integer  "user_id"
    t.string   "stripe_customer_token"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                      :default => "", :null => false
    t.string   "encrypted_password",         :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "name"
    t.string   "stripetoken"
    t.string   "last4"
    t.integer  "num_of_tokens"
    t.boolean  "firsttime"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "current_school"
    t.string   "parent_first_name"
    t.string   "parent_last_name"
    t.string   "parent_cell_phone"
    t.string   "parent_email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "country_code"
    t.string   "telephone"
    t.date     "date_of_birth"
    t.decimal  "current_grade"
    t.boolean  "parent_email_notifications"
    t.boolean  "parent_text_notifications"
    t.integer  "zip_code"
    t.string   "cellphone"
    t.string   "parent_phone"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
