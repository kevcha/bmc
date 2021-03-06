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

ActiveRecord::Schema.define(version: 20170817123256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string   "crypto",                                 null: false
    t.float    "distribution",                           null: false
    t.integer  "report_id",                              null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "coin_id",                                null: false
    t.decimal  "start_price",  precision: 16, scale: 10
    t.decimal  "exit_price",   precision: 16, scale: 10
    t.index ["coin_id"], name: "index_assets_on_coin_id", using: :btree
    t.index ["report_id"], name: "index_assets_on_report_id", using: :btree
  end

  create_table "coins", force: :cascade do |t|
    t.string   "url"
    t.string   "image_url"
    t.string   "name",       null: false
    t.string   "coin_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string   "fund",                          null: false
    t.string   "state",      default: "opened", null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "closed_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "assets", "coins"
  add_foreign_key "assets", "reports"
end
