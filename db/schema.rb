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

ActiveRecord::Schema.define(version: 20140322004956) do

  create_table "actors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
    t.integer  "film_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "actors", ["film_id"], name: "index_actors_on_film_id"

  create_table "actors_films", force: true do |t|
    t.integer "actor_id"
    t.integer "film_id"
  end

  create_table "films", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
