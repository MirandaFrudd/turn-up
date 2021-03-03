# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_27_150108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.integer "budget"
    t.integer "rating"
    t.boolean "day"
    t.boolean "night"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "town"
    t.string "post_code"
    t.datetime "opening_time"
    t.datetime "closing_time"
    t.string "website"
    t.string "photo"
  end

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.integer "budget"
    t.integer "rating"
    t.boolean "day"
    t.boolean "night"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "town"
    t.string "post_code"
    t.string "website"
    t.string "photo"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "bar_id", null: false
    t.bigint "activity_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_favourites_on_activity_id"
    t.index ["bar_id"], name: "index_favourites_on_bar_id"
    t.index ["restaurant_id"], name: "index_favourites_on_restaurant_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.integer "budget"
    t.integer "rating"
    t.boolean "day"
    t.boolean "night"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "town"
    t.string "post_code"
    t.string "website"
    t.string "photo"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "bar_id", null: false
    t.bigint "restaurant_id", null: false
    t.bigint "activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_reviews_on_activity_id"
    t.index ["bar_id"], name: "index_reviews_on_bar_id"
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favourites", "activities"
  add_foreign_key "favourites", "bars"
  add_foreign_key "favourites", "restaurants"
  add_foreign_key "favourites", "users"
  add_foreign_key "reviews", "activities"
  add_foreign_key "reviews", "bars"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
end