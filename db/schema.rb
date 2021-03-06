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

ActiveRecord::Schema.define(version: 20160509024607) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "data_migrations", id: false, force: :cascade do |t|
    t.string "version", limit: 255, null: false
  end

  add_index "data_migrations", ["version"], name: "unique_data_migrations", unique: true, using: :btree

  create_table "menu_item_tags", force: :cascade do |t|
    t.integer  "menu_item_id", limit: 4, null: false
    t.integer  "tag_id",       limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_item_tags", ["menu_item_id", "tag_id"], name: "index_menu_item_tags_on_menu_item_id_and_tag_id", using: :btree

  create_table "menu_items", force: :cascade do |t|
    t.integer  "restaurant_id", limit: 4,     null: false
    t.string   "name",          limit: 255,   null: false
    t.text     "description",   limit: 65535, null: false
    t.integer  "category_id",   limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_items", ["restaurant_id"], name: "index_menu_items_on_restaurant_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",        limit: 255,                           null: false
    t.text     "description", limit: 65535,                         null: false
    t.decimal  "rating",                    precision: 2, scale: 1, null: false
    t.string   "address",     limit: 255,                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name", limit: 255, null: false
    t.string   "last_name",  limit: 255, null: false
    t.string   "email",      limit: 255, null: false
    t.string   "api_key",    limit: 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
