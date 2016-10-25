# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161022181205) do

  create_table "groups", force: :cascade do |t|
    t.string   "letter",     limit: 1
    t.integer  "team_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "groups", ["team_id"], name: "index_groups_on_team_id"

  create_table "heros", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keys", force: :cascade do |t|
    t.string   "des"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lowerbrackets", force: :cascade do |t|
    t.string   "round",      limit: 2
    t.integer  "team_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "lowerbrackets", ["team_id"], name: "index_lowerbrackets_on_team_id"

  create_table "matches", force: :cascade do |t|
    t.date     "date"
    t.boolean  "result"
    t.string   "round",      limit: 2
    t.string   "idgame",     limit: 12
    t.integer  "team_1_id"
    t.integer  "team_2_id"
    t.integer  "phase_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "matches", ["phase_id"], name: "index_matches_on_phase_id"

  create_table "performances", force: :cascade do |t|
    t.integer  "games"
    t.integer  "wins"
    t.integer  "losses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phases", force: :cascade do |t|
    t.string   "des"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "dni_dotero"
    t.string   "nickname"
    t.string   "name"
    t.string   "lastname"
    t.string   "phone",      limit: 12
    t.integer  "team_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id"

  create_table "selecteds", force: :cascade do |t|
    t.integer  "pick_1_id"
    t.integer  "pick_2_id"
    t.integer  "pick_3_id"
    t.integer  "pick_4_id"
    t.integer  "pick_5_id"
    t.integer  "match_id"
    t.string   "bando",      limit: 7
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "selecteds", ["match_id"], name: "index_selecteds_on_match_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "semester",       limit: 2
    t.integer  "performance_id"
    t.integer  "key_id"
    t.integer  "phase_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "teams", ["key_id"], name: "index_teams_on_key_id"
  add_index "teams", ["performance_id"], name: "index_teams_on_performance_id"
  add_index "teams", ["phase_id"], name: "index_teams_on_phase_id"

  create_table "upperbrackets", force: :cascade do |t|
    t.string   "round",      limit: 2
    t.integer  "team_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "upperbrackets", ["team_id"], name: "index_upperbrackets_on_team_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",               default: "", null: false
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.integer  "team_id"
    t.integer  "player_id"
    t.string   "uid"
    t.string   "provider"
    t.integer  "permission_level",       default: 1
    t.string   "image"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
