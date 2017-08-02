class CreateTableComments < ActiveRecord::Migration[5.1]
  create_table "comments", force: :cascade do |t|
    t.integer "task_id"
    t.integer "user_id"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  end