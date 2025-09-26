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

ActiveRecord::Schema[8.0].define(version: 2025_09_26_170449) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "departing_flights_id"
    t.bigint "arriving_flights_id"
    t.index ["arriving_flights_id"], name: "index_airports_on_arriving_flights_id"
    t.index ["departing_flights_id"], name: "index_airports_on_departing_flights_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booked_flight_id", null: false
    t.index ["booked_flight_id"], name: "index_bookings_on_booked_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.bigint "departure_airport_id", null: false
    t.bigint "arrival_airport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "flightstart"
    t.datetime "flightend"
    t.string "flight_name"
    t.bigint "booked_flight_id"
    t.index ["arrival_airport_id"], name: "index_flights_on_arrival_airport_id"
    t.index ["booked_flight_id"], name: "index_flights_on_booked_flight_id"
    t.index ["departure_airport_id"], name: "index_flights_on_departure_airport_id"
  end

  add_foreign_key "airports", "flights", column: "arriving_flights_id"
  add_foreign_key "airports", "flights", column: "departing_flights_id"
  add_foreign_key "bookings", "flights", column: "booked_flight_id"
  add_foreign_key "flights", "airports", column: "arrival_airport_id"
  add_foreign_key "flights", "airports", column: "departure_airport_id"
  add_foreign_key "flights", "bookings", column: "booked_flight_id"
end
