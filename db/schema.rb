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

ActiveRecord::Schema.define(version: 20161127055105) do

  create_table "images", force: :cascade do |t|
    t.integer  "upload_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["upload_id"], name: "index_images_on_upload_id"
  end

  create_table "protections", force: :cascade do |t|
    t.string   "sharedid"
    t.integer  "upload_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["upload_id"], name: "index_protections_on_upload_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tagname"
    t.integer  "upload_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["upload_id"], name: "index_tags_on_upload_id"
  end

  create_table "upload_tests", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "uploads", force: :cascade do |t|
    t.text     "description"
    t.string   "permission"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "url"
    t.integer  "user_id"
    t.index ["created_at"], name: "index_uploads_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_uploads_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "individualrole"
    t.string   "org"
    t.string   "dept"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
