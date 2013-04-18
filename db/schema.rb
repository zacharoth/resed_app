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

ActiveRecord::Schema.define(:version => 20130418205750) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "age_restrict"
    t.string   "label"
    t.string   "website"
    t.time     "time"
    t.date     "date"
    t.boolean  "date_applicable"
    t.boolean  "all_day"
    t.string   "repeat"
    t.string   "day"
    t.string   "address"
    t.text     "description",     :limit => 255
    t.string   "cost"
    t.boolean  "approved"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "issue"
  end

  add_index "events", ["age_restrict"], :name => "index_events_on_age_restrict"
  add_index "events", ["cost"], :name => "index_events_on_cost"
  add_index "events", ["date"], :name => "index_events_on_date"
  add_index "events", ["label"], :name => "index_events_on_label"
  add_index "events", ["location"], :name => "index_events_on_location"
  add_index "events", ["name"], :name => "index_events_on_name", :unique => true

end
