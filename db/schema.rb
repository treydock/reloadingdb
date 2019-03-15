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

ActiveRecord::Schema.define(version: 2019_03_15_170005) do

  create_table "brasses", force: :cascade do |t|
    t.string "name"
    t.integer "caliber_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["caliber_id"], name: "index_brasses_on_caliber_id"
    t.index ["user_id"], name: "index_brasses_on_user_id"
  end

  create_table "bullets", force: :cascade do |t|
    t.string "name"
    t.integer "grain"
    t.integer "caliber_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["caliber_id"], name: "index_bullets_on_caliber_id"
    t.index ["user_id"], name: "index_bullets_on_user_id"
  end

  create_table "calibers", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_calibers_on_user_id"
  end

  create_table "loads", force: :cascade do |t|
    t.integer "caliber_id"
    t.integer "brass_id"
    t.float "brass_length"
    t.date "date"
    t.integer "user_id"
    t.integer "bullet_id"
    t.integer "powder_id"
    t.float "powder_weight"
    t.integer "primer_id"
    t.float "col"
    t.integer "velocity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notes"
    t.integer "brass_uses"
    t.float "run_out"
    t.integer "rounds"
    t.string "col_unit"
    t.string "velocity_unit"
    t.string "run_out_unit"
    t.string "brass_length_unit"
    t.index ["brass_id"], name: "index_loads_on_brass_id"
    t.index ["bullet_id"], name: "index_loads_on_bullet_id"
    t.index ["caliber_id"], name: "index_loads_on_caliber_id"
    t.index ["powder_id"], name: "index_loads_on_powder_id"
    t.index ["primer_id"], name: "index_loads_on_primer_id"
    t.index ["user_id"], name: "index_loads_on_user_id"
  end

  create_table "powders", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_powders_on_user_id"
  end

  create_table "primers", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_primers_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.string "target_type", null: false
    t.integer "target_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["target_type", "target_id", "var"], name: "index_settings_on_target_type_and_target_id_and_var", unique: true
    t.index ["target_type", "target_id"], name: "index_settings_on_target_type_and_target_id"
  end

  create_table "shooting_groups", force: :cascade do |t|
    t.integer "shooting_log_id"
    t.integer "user_id"
    t.integer "load_id"
    t.integer "number"
    t.integer "distance"
    t.string "distance_unit"
    t.integer "shots"
    t.float "elevation_adjustment"
    t.string "elevation_adjustment_direction"
    t.string "elevation_adjustment_unit"
    t.float "windage_adjustment"
    t.string "windage_adjustment_direction"
    t.string "windage_adjustment_unit"
    t.integer "wind_speed"
    t.string "wind_speed_unit"
    t.integer "wind_direction"
    t.float "group_size"
    t.string "group_size_unit"
    t.integer "velocity"
    t.string "velocity_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["load_id"], name: "index_shooting_groups_on_load_id"
    t.index ["shooting_log_id"], name: "index_shooting_groups_on_shooting_log_id"
    t.index ["user_id"], name: "index_shooting_groups_on_user_id"
  end

  create_table "shooting_locations", force: :cascade do |t|
    t.string "name"
    t.decimal "latitude"
    t.decimal "longitude"
    t.decimal "elevation"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shooting_locations_on_user_id"
  end

  create_table "shooting_logs", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.integer "shooting_location_id"
    t.integer "temperature"
    t.float "pressure"
    t.integer "angle"
    t.text "conditions"
    t.integer "humidity"
    t.integer "wind_speed"
    t.integer "wind_direction"
    t.text "notes"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "temperature_unit"
    t.string "pressure_unit"
    t.string "wind_speed_unit"
    t.index ["shooting_location_id"], name: "index_shooting_logs_on_shooting_location_id"
    t.index ["user_id"], name: "index_shooting_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
