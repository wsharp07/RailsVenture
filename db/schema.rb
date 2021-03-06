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

ActiveRecord::Schema.define(version: 20151018041136) do

  create_table "hardware_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rmas", force: :cascade do |t|
    t.string   "rma_number",       null: false
    t.string   "serial_number"
    t.string   "reference_number"
    t.string   "tracking_number"
    t.integer  "status"
    t.string   "comments"
    t.datetime "received_at"
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hardware_type_id"
  end

  add_index "rmas", ["hardware_type_id"], name: "index_rmas_on_hardware_type_id"

  create_table "time_offs", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.integer  "request_type_id",    null: false
    t.datetime "request_start_date", null: false
    t.datetime "request_end_date",   null: false
    t.integer  "status",             null: false
    t.string   "comments"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest",   limit: 255
    t.string   "username",          limit: 255
    t.string   "remember_digest",   limit: 255
    t.boolean  "admin",                         default: false
    t.string   "activation_digest", limit: 255
    t.boolean  "activated",                     default: false
    t.datetime "activated_at"
    t.string   "reset_digest",      limit: 255
    t.datetime "reset_sent_at"
    t.string   "first_name"
    t.string   "last_name"
  end

end
