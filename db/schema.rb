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

ActiveRecord::Schema.define(version: 20180926122452) do

  create_table "friend_requests", force: :cascade do |t|
    t.integer "requester_id"
    t.integer "user_id"
    t.index ["requester_id"], name: "index_friend_requests_on_requester_id"
    t.index ["user_id", "requester_id"], name: "index_friend_requests_on_user_id_and_requester_id", unique: true
    t.index ["user_id"], name: "index_friend_requests_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "hh_attributes", force: :cascade do |t|
    t.time "time"
    t.integer "lifts"
    t.integer "simple_post_id"
    t.index ["simple_post_id"], name: "index_hh_attributes_on_simple_post_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "hh_attribute_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hh_attribute_id"], name: "index_locations_on_hh_attribute_id"
  end

  create_table "simple_posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "text"
    t.string "pictures"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_simple_posts_on_user_id_and_created_at", unique: true
    t.index ["user_id"], name: "index_simple_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", default: "Melinda Musterfrau"
    t.string "base", default: "Utopia"
    t.date "birthday", default: "1990-01-01"
    t.string "countries", default: "Utopia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.integer "km", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
