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

ActiveRecord::Schema.define(version: 2021_05_21_032508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_favorites_on_post_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_follows_on_post_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "author_id", null: false
    t.integer "replies_count", default: 0
    t.integer "votes_count", default: 0
    t.integer "favorites_count", default: 0
    t.integer "follows_count", default: 0
    t.integer "tags_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
  end

  create_table "replies", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "post_id", null: false
    t.text "body"
    t.string "repliable_type", null: false
    t.bigint "repliable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_replies_on_author_id"
    t.index ["post_id"], name: "index_replies_on_post_id"
    t.index ["repliable_type", "repliable_id"], name: "index_replies_on_repliable"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "tag_joins_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.citext "username"
    t.string "avatar_img"
    t.string "website"
    t.string "bio"
    t.integer "posts_count", default: 0
    t.integer "replies_count", default: 0
    t.integer "votes_count", default: 0
    t.integer "favorites_count", default: 0
    t.integer "follows_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "fan_id_id", null: false
    t.integer "vote_status"
    t.integer "votes_count", default: 0
    t.integer "favorites_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fan_id_id"], name: "index_votes_on_fan_id_id"
    t.index ["post_id"], name: "index_votes_on_post_id"
  end

  add_foreign_key "favorites", "posts"
  add_foreign_key "favorites", "users"
  add_foreign_key "follows", "posts"
  add_foreign_key "follows", "users"
  add_foreign_key "posts", "users", column: "author_id"
  add_foreign_key "replies", "posts"
  add_foreign_key "replies", "users", column: "author_id"
  add_foreign_key "votes", "posts"
  add_foreign_key "votes", "users", column: "fan_id_id"
end
