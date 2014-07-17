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

ActiveRecord::Schema.define(version: 20140716010219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stations", force: true do |t|
    t.integer  "position"
    t.integer  "dock_id"
    t.integer  "available"
    t.integer  "total_docks"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latidude"
    t.float    "logitude"
    t.string   "cross_st1"
    t.string   "cross_st2"
  end

  create_table "users", force: true do |t|
    t.string   "uname"
    t.string   "pwd"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
