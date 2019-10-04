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

ActiveRecord::Schema.define(version: 2019_10_03_232740) do

  create_table "appointements", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer "pro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_id"], name: "index_appointements_on_pro_id"
  end

  create_table "booking_prestations", force: :cascade do |t|
    t.integer "booking_id"
    t.integer "prestation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_prestations_on_booking_id"
    t.index ["prestation_id"], name: "index_booking_prestations_on_prestation_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "starts_at"
    t.text "address"
    t.integer "lat"
    t.integer "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "openning_hours", force: :cascade do |t|
    t.string "day"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer "pro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_id"], name: "index_openning_hours_on_pro_id"
  end

  create_table "prestations", force: :cascade do |t|
    t.string "reference"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pro_prestations", force: :cascade do |t|
    t.integer "pro_id"
    t.integer "prestation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prestation_id"], name: "index_pro_prestations_on_prestation_id"
    t.index ["pro_id"], name: "index_pro_prestations_on_pro_id"
  end

  create_table "pros", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.integer "lat"
    t.integer "lng"
    t.integer "max_kilometers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

end
