# -*- encoding : utf-8 -*-
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

ActiveRecord::Schema.define(:version => 20131220084518) do

  create_table "bell_tags", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "bell_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bell_tags", ["bell_id"], :name => "index_bell_tags_on_bell_id"
  add_index "bell_tags", ["tag_id"], :name => "index_bell_tags_on_tag_id"

  create_table "bells", :force => true do |t|
    t.string   "name"
    t.string   "zone"
    t.string   "file_location"
    t.integer  "file_size"
    t.string   "duration"
    t.string   "singer"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "game_sources", :force => true do |t|
    t.integer  "game_id"
    t.string   "source_url"
    t.string   "source_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "game_sources", ["game_id"], :name => "index_game_sources_on_game_id"

  create_table "games", :force => true do |t|
    t.string   "match_date"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
