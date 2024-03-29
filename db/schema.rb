# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_13_002240) do

  create_table "channels", charset: "utf8mb4", force: :cascade do |t|
    t.string "channel_name"
    t.string "channel_url"
    t.string "icon"
    t.string "search_key"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_channels_on_user_id"
  end

  create_table "guide_videos", charset: "utf8mb4", force: :cascade do |t|
    t.integer "start_h"
    t.integer "start_m"
    t.bigint "guide_id", null: false
    t.bigint "video_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guide_id"], name: "index_guide_videos_on_guide_id"
    t.index ["video_id"], name: "index_guide_videos_on_video_id"
  end

  create_table "guides", charset: "utf8mb4", force: :cascade do |t|
    t.string "guide_name"
    t.date "on_air"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_guides_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "videos", charset: "utf8mb4", force: :cascade do |t|
    t.string "video_name"
    t.string "media"
    t.string "video_url"
    t.string "thumbnail"
    t.bigint "channel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_videos_on_channel_id"
  end

  add_foreign_key "channels", "users"
  add_foreign_key "guide_videos", "guides"
  add_foreign_key "guide_videos", "videos"
  add_foreign_key "guides", "users"
  add_foreign_key "videos", "channels"
end
