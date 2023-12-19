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

ActiveRecord::Schema[7.0].define(version: 2023_12_19_171351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "geo_locations", force: :cascade do |t|
    t.decimal "lat"
    t.decimal "lng"
    t.string "city"
    t.string "country"
    t.string "continent"
    t.string "locationable_type", null: false
    t.bigint "locationable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locationable_type", "locationable_id"], name: "index_geo_locations_on_locationable"
  end

  create_table "ip_resources", force: :cascade do |t|
    t.inet "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ip_address"], name: "index_ip_resources_on_ip_address", unique: true
  end

  create_table "url_resources", force: :cascade do |t|
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_url_resources_on_url", unique: true
  end

end
