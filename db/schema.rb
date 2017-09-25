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

ActiveRecord::Schema.define(version: 20170904130755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
  end

  create_table "activities", force: :cascade do |t|
    t.bigint "user_id"
    t.string "action"
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_comments_on_task_id"
  end

  create_table "dispute_users", force: :cascade do |t|
    t.integer "dispute_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_read_at"
    t.index ["dispute_id"], name: "index_dispute_users_on_dispute_id"
    t.index ["user_id"], name: "index_dispute_users_on_user_id"
  end

  create_table "disputes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "direct_message", default: false
  end

  create_table "error_messages", force: :cascade do |t|
    t.text "class_name"
    t.text "message"
    t.text "trace"
    t.text "params"
    t.text "target_url"
    t.text "referer_url"
    t.text "user_agent"
    t.string "user_info"
    t.string "app_name"
    t.string "doc_root"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infos", force: :cascade do |t|
    t.text "name"
    t.text "surname"
    t.text "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dob"
    t.text "about"
    t.string "location"
    t.integer "user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "task_id"
    t.string "lat"
    t.string "long"
    t.string "location_name"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "dispute_id"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dispute_id"], name: "index_messages_on_dispute_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "moderators", force: :cascade do |t|
    t.string "login"
    t.string "name"
    t.string "last_name"
    t.integer "user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "header_ru"
    t.string "header_en"
    t.string "header_ua"
    t.text "text_ru"
    t.text "text_en"
    t.text "text_ua"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "photo_id_1"
    t.string "photo_id_2"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_taggings", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "post_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_taggings_on_post_id"
    t.index ["post_tag_id"], name: "index_post_taggings_on_post_tag_id"
  end

  create_table "post_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "summary"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "category_id"
    t.integer "user_id"
    t.index ["category_id"], name: "index_posts_on_category_id"
  end

  create_table "response_lists", force: :cascade do |t|
    t.integer "task_id"
    t.integer "performer_id"
    t.text "response_text"
    t.string "response_status"
  end

  create_table "responses", force: :cascade do |t|
    t.text "response"
    t.boolean "accept"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.integer "user_reviewed"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_skills_on_tag_id"
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "tables", force: :cascade do |t|
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "task_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["task_id"], name: "index_taggings_on_task_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_attachments", force: :cascade do |t|
    t.integer "task_id"
  end

  create_table "task_locatings", force: :cascade do |t|
    t.integer "task_id"
    t.integer "location_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "summary"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "category_id"
    t.integer "user_id"
    t.decimal "price_max"
    t.decimal "price_min"
    t.boolean "price_from_performer", default: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "task_status"
    t.string "tasks_verified"
    t.datetime "finish_time"
    t.integer "performer_id"
    t.integer "moderator_id"
    t.index ["category_id"], name: "index_tasks_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.boolean "moderator", default: false
    t.boolean "performer_role", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "post_taggings", "post_tags"
  add_foreign_key "post_taggings", "posts"
end
