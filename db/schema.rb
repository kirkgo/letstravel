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

ActiveRecord::Schema.define(version: 2022_06_10_110707) do

  create_table "bookings", force: :cascade do |t|
    t.integer "passenger_id", null: false
    t.integer "trip_id", null: false
    t.integer "status", default: 0
    t.boolean "extra_luggage", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["passenger_id"], name: "index_bookings_on_passenger_id"
    t.index ["trip_id"], name: "index_bookings_on_trip_id"
  end

  create_table "buses", force: :cascade do |t|
    t.string "bus_code"
    t.boolean "extra_luggage", default: false
    t.integer "seats"
    t.decimal "seat_price", precision: 5, scale: 2
    t.decimal "decimal", precision: 5, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "cardholder"
    t.string "number"
    t.string "expire_date"
    t.string "cvv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "id_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_passengers_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "code"
    t.integer "booking_id", null: false
    t.integer "status", default: 0
    t.decimal "price", precision: 5, scale: 2
    t.boolean "extra_luggage", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_tickets_on_booking_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "bus_id", null: false
    t.integer "departure_id", null: false
    t.integer "arrival_id", null: false
    t.datetime "departure_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "booked_seats", default: 0
    t.index ["arrival_id"], name: "index_trips_on_arrival_id"
    t.index ["bus_id"], name: "index_trips_on_bus_id"
    t.index ["departure_id"], name: "index_trips_on_departure_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "passengers"
  add_foreign_key "bookings", "trips"
  add_foreign_key "credit_cards", "users"
  add_foreign_key "passengers", "users"
  add_foreign_key "tickets", "bookings"
  add_foreign_key "trips", "buses"
  add_foreign_key "trips", "cities", column: "arrival_id"
  add_foreign_key "trips", "cities", column: "departure_id"
end
