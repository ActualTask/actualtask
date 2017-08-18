class RenameTable < ActiveRecord::Migration[5.1]
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

end
