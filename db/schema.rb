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

ActiveRecord::Schema.define(version: 2020_05_12_205518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "study_group_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["study_group_id"], name: "index_comments_on_study_group_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "capacity"
    t.string "city"
  end

  create_table "participants", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "study_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["study_group_id"], name: "index_participants_on_study_group_id"
    t.index ["user_id", "study_group_id"], name: "index_participants_on_user_id_and_study_group_id", unique: true
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "study_groups", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "location_id", null: false
    t.integer "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.time "time"
    t.float "duration"
    t.integer "num_participants"
    t.string "name"
    t.text "description"
    t.index ["location_id"], name: "index_study_groups_on_location_id"
    t.index ["subject_id"], name: "index_study_groups_on_subject_id"
    t.index ["user_id"], name: "index_study_groups_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "study_groups"
  add_foreign_key "comments", "users"
  add_foreign_key "participants", "study_groups"
  add_foreign_key "participants", "users"
  add_foreign_key "study_groups", "locations"
  add_foreign_key "study_groups", "subjects"
  add_foreign_key "study_groups", "users"
end
