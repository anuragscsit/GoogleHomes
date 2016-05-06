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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160506201622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bathroom_amenities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bedroom_amenities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "house_owner_profiles", force: :cascade do |t|
    t.date     "DOB"
    t.string   "sex"
    t.text     "bio"
    t.string   "occupation"
    t.string   "work_detail"
    t.string   "p_address"
    t.string   "p_city"
    t.string   "p_state"
    t.integer  "p_pincode"
    t.string   "c_address"
    t.string   "c_city"
    t.string   "c_state"
    t.integer  "c_pincode"
    t.integer  "house_owner_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "subscription",   default: false
    t.string   "image"
  end

  create_table "house_owners", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "house_owners", ["email"], name: "index_house_owners_on_email", unique: true, using: :btree
  add_index "house_owners", ["reset_password_token"], name: "index_house_owners_on_reset_password_token", unique: true, using: :btree

  create_table "houses", force: :cascade do |t|
    t.string   "name"
    t.string   "house_type",            default: "1BHK"
    t.string   "house_for",             default: "boys"
    t.integer  "no_of_rooms",           default: 1
    t.integer  "no_of_beds",            default: 1
    t.integer  "rent_per_room",         default: 1
    t.integer  "rent_per_bed",          default: 3000
    t.string   "food_preference",       default: "none"
    t.text     "livingroom_amenities",  default: [],                  array: true
    t.text     "bedroom_amenities",     default: [],                  array: true
    t.text     "bathroom_amenities",    default: [],                  array: true
    t.text     "kitchen_amenities",     default: [],                  array: true
    t.text     "other_amenities",       default: [],                  array: true
    t.text     "house_image",           default: [],                  array: true
    t.string   "city"
    t.string   "location"
    t.string   "distance_from_station"
    t.integer  "visit_count",           default: 0
    t.integer  "house_owner_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "kitchen_amenities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "livingroom_amenities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_amenities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "city"
    t.string   "location"
    t.string   "room_for"
    t.string   "need_within"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenant_profiles", force: :cascade do |t|
    t.date     "DOB"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "sex"
    t.text     "bio"
    t.string   "occupation"
    t.string   "work_place"
    t.string   "father_name"
    t.string   "p_address"
    t.string   "p_city"
    t.string   "p_state"
    t.integer  "p_pincode"
    t.string   "c_address"
    t.string   "c_city"
    t.string   "c_state"
    t.integer  "c_pincode"
    t.integer  "tenant_id"
    t.boolean  "subscription", default: true
    t.string   "image"
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "tenants", ["email"], name: "index_tenants_on_email", unique: true, using: :btree
  add_index "tenants", ["reset_password_token"], name: "index_tenants_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "referrer"
    t.string   "contact_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visit_schedules", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "date"
    t.string   "time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "house_owner_id"
    t.integer  "house_id"
  end

end
