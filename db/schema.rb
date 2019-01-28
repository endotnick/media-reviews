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

ActiveRecord::Schema.define(version: 2019_01_28_004825) do

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.integer "medium_id"
    t.integer "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_episodes_on_medium_id"
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "medium_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "medium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_movies_on_medium_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.string "rating"
    t.integer "user_id"
    t.integer "medium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_reviews_on_medium_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "number"
    t.integer "medium_id"
    t.integer "series_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_seasons_on_medium_id"
    t.index ["series_id"], name: "index_seasons_on_series_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "title"
    t.integer "medium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_series_on_medium_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "views", force: :cascade do |t|
    t.boolean "viewed"
    t.integer "user_id"
    t.integer "medium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_views_on_medium_id"
    t.index ["user_id"], name: "index_views_on_user_id"
  end

end
