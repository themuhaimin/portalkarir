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

ActiveRecord::Schema.define(version: 20150602121108) do

  create_table "jabatans", force: :cascade do |t|
    t.string   "nama_jabatan", default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "jabatans", ["nama_jabatan"], name: "index_jabatans_on_nama_jabatan", unique: true

  create_table "lowongans", force: :cascade do |t|
    t.integer  "jabatan_id"
    t.integer  "pendidikan_id"
    t.integer  "limit_umur"
    t.text     "ket_umum",      null: false
    t.text     "deskripsi",     null: false
    t.boolean  "posted"
    t.datetime "max_tgl",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "lowongans", ["jabatan_id"], name: "index_lowongans_on_jabatan_id"
  add_index "lowongans", ["pendidikan_id"], name: "index_lowongans_on_pendidikan_id"

  create_table "pendidikans", force: :cascade do |t|
    t.string   "level_pend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pendidikans", ["level_pend"], name: "index_pendidikans_on_level_pend", unique: true

  create_table "profils", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nama_lengkap",    null: false
    t.string   "no_identitas",    null: false
    t.boolean  "jenis_kelamin"
    t.text     "alamat",          null: false
    t.string   "tempat_lahir",    null: false
    t.datetime "tgl_lahir",       null: false
    t.string   "no_hp",           null: false
    t.integer  "pendididikan_id"
    t.string   "nama_pend",       null: false
    t.string   "jurusan",         null: false
    t.float    "nilai"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "profils", ["pendididikan_id"], name: "index_profils_on_pendididikan_id"
  add_index "profils", ["user_id"], name: "index_profils_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nama",                   default: "", null: false
    t.boolean  "admin"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
