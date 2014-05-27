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

ActiveRecord::Schema.define(version: 20140527161438) do

  create_table "aligns", force: true do |t|
    t.integer  "align",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aligns_id"
    t.string   "aligns_type"
  end

  create_table "annoncments", force: true do |t|
    t.string   "title",                              null: false
    t.string   "description",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "english_description",   default: ""
    t.integer  "category_id"
    t.integer  "position",              default: 0,  null: false
    t.integer  "submenu_id"
    t.datetime "date_at"
    t.datetime "date_to"
    t.integer  "font_weight_title",     default: 0,  null: false
    t.integer  "font_size_title",       default: 12, null: false
    t.integer  "text_decoration_title", default: 0,  null: false
  end

  add_index "annoncments", ["category_id"], name: "annoncments_category_id_to_category"
  add_index "annoncments", ["submenu_id"], name: "annoncments_submenu_id_to_submenus"

  create_table "background_annoncments", force: true do |t|
    t.integer  "annoncment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "background_annoncments", ["annoncment_id"], name: "background_annoncment_id_to_annoncments"

  create_table "background_by_defaults", force: true do |t|
    t.string   "title",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid"
    t.boolean  "activation", default: false
  end

  create_table "background_contents", force: true do |t|
    t.integer  "content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "background_contents", ["content_id"], name: "background_content_id_to_contents"

  create_table "backgrounds", force: true do |t|
    t.integer "border",                 default: 0,             null: false
    t.string  "border_style",           default: "solid",       null: false
    t.string  "border_color",           default: "transparent", null: false
    t.string  "background_color",       default: "transparent"
    t.string  "background_image"
    t.string  "cached_path"
    t.integer "backgroundstyles_id"
    t.string  "backgroundstyles_type"
    t.boolean "no_background_image",    default: false
    t.boolean "no_repeat",              default: false
    t.string  "background_image_cache"
    t.integer "align",                  default: 0
  end

  create_table "categories", force: true do |t|
    t.string   "title",                                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",      default: 1
    t.string   "english_title", default: "english title"
    t.boolean  "sub_menu",      default: false
    t.string   "color_font",    default: "black",         null: false
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

  create_table "contact_us", force: true do |t|
    t.string   "title",      null: false
    t.string   "email",      null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", force: true do |t|
    t.text     "description",                      null: false
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "english_description"
    t.integer  "position",            default: 1,  null: false
    t.string   "uuid",                default: "", null: false
    t.integer  "submenu_id"
  end

  add_index "contents", ["submenu_id"], name: "contents_submenu_id_to_submenus"

  create_table "contents_or_annoncments", force: true do |t|
    t.integer  "content_or_annoncment",        default: 1, null: false
    t.integer  "contents_or_annoncments_id"
    t.string   "contents_or_annoncments_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "footer_backgrounds", force: true do |t|
    t.string   "uuid",       null: false
    t.string   "title",      null: false
    t.boolean  "activation", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "footers", force: true do |t|
    t.string   "legal_mention", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galery_photos", force: true do |t|
    t.string   "uuid",                          null: false
    t.string   "title",                         null: false
    t.text     "comment",                       null: false
    t.string   "photogalery"
    t.string   "photogalery_cache"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "submenu_id"
    t.integer  "position",          default: 0, null: false
  end

  add_index "galery_photos", ["category_id"], name: "galery_photos_category_id_to_category"
  add_index "galery_photos", ["submenu_id"], name: "galery_photos_submenu_id_to_submenu"

  create_table "header_backgrounds", force: true do |t|
    t.string   "title",                      null: false
    t.string   "uuid",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activation", default: false
  end

  create_table "homepage_submenus", force: true do |t|
    t.boolean  "homepage",               default: false, null: false
    t.integer  "homepage_submenus_id"
    t.string   "homepage_submenus_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locakables", force: true do |t|
    t.boolean "lockable",       default: true, null: false
    t.integer "lockables_id"
    t.string  "lockables_type"
  end

  create_table "menu_backgrounds", force: true do |t|
    t.string   "uuid",                       null: false
    t.string   "title",                      null: false
    t.boolean  "activation", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personalize_backgrounds", force: true do |t|
    t.string   "title",                        null: false
    t.string   "uuid",                         null: false
    t.boolean  "activation", default: false,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "font_color", default: "black", null: false
    t.integer  "margin_top", default: 0,       null: false
  end

  create_table "photos", force: true do |t|
    t.string  "photo"
    t.string  "photo_cache"
    t.integer "annoncment_id"
    t.boolean "master_image",  default: false
    t.string  "uuid",          default: "0",   null: false
  end

  add_index "photos", ["annoncment_id"], name: "photos_annoncment_id_to_photo"

  create_table "robot_keys", force: true do |t|
    t.string  "uuid",    null: false
    t.string  "name",    null: false
    t.integer "lang",    null: false
    t.text    "content", null: false
  end

  create_table "sub_menu_backgrounds", force: true do |t|
    t.string   "uuid",                       null: false
    t.string   "title",                      null: false
    t.boolean  "activation", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submenus", force: true do |t|
    t.string   "title"
    t.integer  "position",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "color_font",    default: "black",                 null: false
    t.string   "english_title", default: "English title submenu", null: false
  end

  add_index "submenus", ["category_id"], name: "submenus_category_id_to_category"

  create_table "users", force: true do |t|
    t.string   "login",                  default: "", null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
