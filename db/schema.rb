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

ActiveRecord::Schema.define(version: 20141022054529) do

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.string   "event_type"
    t.string   "name"
    t.date     "date"
    t.time     "time"
    t.integer  "budget"
    t.string   "bride_name"
    t.string   "groom_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["user_id", "created_at"], name: "index_events_on_user_id_and_created_at"

  create_table "shops", force: true do |t|
    t.integer  "user_id"
    t.string   "shop_type"
    t.string   "name"
    t.string   "price_range"
    t.string   "description"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "primary_contact"
    t.string   "website"
    t.string   "details"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["user_id", "created_at"], name: "index_shops_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "role"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "primary_contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
