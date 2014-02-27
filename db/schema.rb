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

ActiveRecord::Schema.define(version: 20140227184203) do

  create_table "annoncments", force: true do |t|
    t.string   "title",                            null: false
    t.string   "description",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "english_description", default: ""
    t.integer  "category_id"
    t.integer  "position",            default: 0,  null: false
    t.integer  "submenu_id"
  end

  add_index "annoncments", ["category_id"], name: "annoncments_category_id_to_category"
  add_index "annoncments", ["submenu_id"], name: "annoncments_submenu_id_to_submenus"

  create_table "backgrounds", force: true do |t|
    t.integer "border",                default: 0,             null: false
    t.string  "border_style",          default: "solid",       null: false
    t.string  "border_color",          default: "transparent", null: false
    t.string  "background_color",      default: "transparent"
    t.string  "background_image"
    t.string  "cached_path"
    t.integer "backgroundstyles_id"
    t.string  "backgroundstyles_type"
  end

  create_table "categories", force: true do |t|
    t.string   "title",                                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",      default: 1
    t.string   "english_title", default: "english title"
    t.boolean  "sub_menu",      default: false
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "contents", force: true do |t|
    t.text     "description",                                    null: false
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "english_description"
    t.integer  "position",               default: 1,             null: false
    t.string   "uuid",                   default: "",            null: false
    t.integer  "border",                 default: 0,             null: false
    t.string   "border_style",           default: "solid",       null: false
    t.string   "border_color",           default: "transparent", null: false
    t.string   "background_color",       default: "transparent"
    t.string   "background_image"
    t.string   "background_image_cache"
    t.boolean  "no_repeat",              default: false,         null: false
    t.boolean  "no_background_image",    default: true,          null: false
    t.integer  "submenu_id"
  end

  add_index "contents", ["submenu_id"], name: "contents_submenu_id_to_submenus"

  create_table "contents_or_annoncments", force: true do |t|
    t.boolean  "content_or_annoncment",        default: true, null: false
    t.integer  "contents_or_annoncments_id"
    t.string   "contents_or_annoncments_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homepage_submenus", force: true do |t|
    t.boolean  "homepage",               default: false, null: false
    t.integer  "homepage_submenus_id"
    t.string   "homepage_submenus_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string  "photo"
    t.string  "photo_cache"
    t.integer "annoncment_id"
    t.boolean "master_image",  default: false
    t.string  "uuid",          default: "0",   null: false
  end

  add_index "photos", ["annoncment_id"], name: "photos_annoncment_id_to_photo"

  create_table "submenus", force: true do |t|
    t.string   "title"
    t.integer  "position",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "submenus", ["category_id"], name: "submenus_category_id_to_category"

end
