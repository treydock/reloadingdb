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

ActiveRecord::Schema.define(version: 2019_03_06_001459) do

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
    t.string "grain"
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
    t.string "brass_length"
    t.date "date"
    t.integer "user_id"
    t.integer "bullet_id"
    t.integer "powder_id"
    t.string "powder_weight"
    t.integer "primer_id"
    t.string "col"
    t.string "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
