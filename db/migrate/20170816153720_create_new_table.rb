class CreateNewTable < ActiveRecord::Migration[5.1]

  create_table "chatroom_users", force: :cascade do |t|
    t.integer  "chatroom_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "last_read_at"
    t.index ["chatroom_id"], name: "index_chatroom_users_on_chatroom_id"
    t.index ["user_id"], name: "index_chatroom_users_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "direct_message", default: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "chatroom_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end


end

create_table "messages", force: :cascade do |t|
  t.integer "chatroom_id"
  t.integer "user_id"
  t.text "body"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
  t.index ["user_id"], name: "index_messages_on_user_id"
end
