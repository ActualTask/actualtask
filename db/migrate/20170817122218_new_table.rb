class NewTable < ActiveRecord::Migration[5.1]
  create_table "messages", force: :cascade do |t|
    t.integer "disput_id"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disput_id"], name: "index_messages_on_disput_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

end
