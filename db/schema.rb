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

ActiveRecord::Schema.define(version: 20141210204250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_connections", force: true do |t|
    t.integer  "user_id"
    t.integer  "board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boards", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "list_order",      default: [],    array: true
    t.integer  "organisation_id"
    t.integer  "organization_id"
    t.boolean  "marked",          default: false
  end

  add_index "boards", ["organisation_id"], name: "index_boards_on_organisation_id", using: :btree
  add_index "boards", ["organization_id"], name: "index_boards_on_organization_id", using: :btree

  create_table "card_comments", force: true do |t|
    t.text     "comment_body"
    t.integer  "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_date"
    t.string   "label_color"
    t.boolean  "archivised",  default: false
  end

  create_table "lists", force: true do |t|
    t.string   "title"
    t.integer  "board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "archivised", default: false
  end

  create_table "organization_invitations", force: true do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organization_invitations", ["organization_id"], name: "index_organization_invitations_on_organization_id", using: :btree
  add_index "organization_invitations", ["user_id"], name: "index_organization_invitations_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_id"
    t.boolean  "public"
  end

  add_index "organizations", ["admin_id"], name: "index_organizations_on_admin_id", using: :btree

  create_table "user_organization_connections", force: true do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_organization_connections", ["organization_id"], name: "index_user_organization_connections_on_organization_id", using: :btree
  add_index "user_organization_connections", ["user_id"], name: "index_user_organization_connections_on_user_id", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
