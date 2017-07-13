class CreateTable < ActiveRecord::Migration[5.1]
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

  create_table "skills", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_skills_on_tag_id"
    t.index ["user_id"], name: "index_skills_on_user_id"
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

end