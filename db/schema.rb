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
    t.integer  "team_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "groups", ["team_id"], name: "index_groups_on_team_id", using: :btree

  create_table "heros", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "keys", force: :cascade do |t|
    t.string   "des",        limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "lowerbrackets", force: :cascade do |t|
    t.string   "round",      limit: 2
    t.integer  "team_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "lowerbrackets", ["team_id"], name: "index_lowerbrackets_on_team_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.date     "date"
    t.boolean  "result",     limit: 1
    t.string   "round",      limit: 2
    t.string   "idgame",     limit: 12
    t.integer  "team_1_id",  limit: 4
    t.integer  "team_2_id",  limit: 4
    t.integer  "phase_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "matches", ["phase_id"], name: "index_matches_on_phase_id", using: :btree

  create_table "performances", force: :cascade do |t|
    t.integer  "games",      limit: 4
    t.integer  "wins",       limit: 4
    t.integer  "losses",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "phases", force: :cascade do |t|
    t.string   "des",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "dni_dotero", limit: 255
    t.string   "nickname",   limit: 255
    t.string   "name",       limit: 255
    t.string   "lastname",   limit: 255
    t.string   "phone",      limit: 12
    t.integer  "team_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "selecteds", force: :cascade do |t|
    t.integer  "pick_1_id",  limit: 4
    t.integer  "pick_2_id",  limit: 4
    t.integer  "pick_3_id",  limit: 4
    t.integer  "pick_4_id",  limit: 4
    t.integer  "pick_5_id",  limit: 4
    t.integer  "match_id",   limit: 4
    t.string   "bando",      limit: 7
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "selecteds", ["match_id"], name: "index_selecteds_on_match_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "logo",           limit: 255
    t.string   "semester",       limit: 2
    t.integer  "performance_id", limit: 4
    t.integer  "key_id",         limit: 4
    t.integer  "phase_id",       limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "teams", ["key_id"], name: "index_teams_on_key_id", using: :btree
  add_index "teams", ["performance_id"], name: "index_teams_on_performance_id", using: :btree
  add_index "teams", ["phase_id"], name: "index_teams_on_phase_id", using: :btree

  create_table "upperbrackets", force: :cascade do |t|
    t.string   "round",      limit: 2
    t.integer  "team_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "upperbrackets", ["team_id"], name: "index_upperbrackets_on_team_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "username",               limit: 255,   default: "", null: false
    t.string   "name",                   limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.text     "bio",                    limit: 65535
    t.integer  "team_id",                limit: 4
    t.integer  "player_id",              limit: 4
    t.string   "uid",                    limit: 255
    t.string   "provider",               limit: 255
    t.integer  "permission_level",       limit: 4,     default: 1
    t.string   "image",                  limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["player_id"], name: "fk_rails_ef78341c6b", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["team_id"], name: "fk_rails_4854cea801", using: :btree

  add_foreign_key "groups", "teams"
  add_foreign_key "lowerbrackets", "teams"
  add_foreign_key "matches", "phases"
  add_foreign_key "players", "teams"
  add_foreign_key "selecteds", "matches"
  add_foreign_key "teams", "keys"
  add_foreign_key "teams", "performances"
  add_foreign_key "teams", "phases"
  add_foreign_key "upperbrackets", "teams"
  add_foreign_key "users", "players"
  add_foreign_key "users", "teams"
end
