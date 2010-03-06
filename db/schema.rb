# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100306111632) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_job_requests", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "job_request_id"
  end

  create_table "help_offers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_request_id"
    t.text     "comment"
    t.boolean  "accepted"
    t.text     "response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_requests", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "duration"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organisation_name"
    t.string   "phone_number"
    t.string   "email_address"
    t.string   "helpee_name"
    t.string   "location"
    t.date     "start_at"
    t.date     "end_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.boolean  "email_confirmed",                   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "real_name"
    t.string   "skills"
    t.string   "reason"
    t.string   "my_job"
    t.string   "website"
    t.text     "about_me"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["id", "confirmation_token"], :name => "index_users_on_id_and_confirmation_token"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
