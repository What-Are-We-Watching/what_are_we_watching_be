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

ActiveRecord::Schema.define(version: 2022_08_30_145748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_movies", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "movie_id"
    t.integer "vote", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_movies_on_event_id"
    t.index ["movie_id"], name: "index_event_movies_on_movie_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.string "name"
    t.bigint "user_id"
    t.integer "movie_selection_id"
    t.integer "status", default: 0
    t.integer "guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "moviedb_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_movies", "events"
  add_foreign_key "event_movies", "movies"
  add_foreign_key "events", "users"
end
