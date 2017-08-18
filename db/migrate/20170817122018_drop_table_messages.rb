class DropTableMessages < ActiveRecord::Migration[5.1]
  def change
    drop_table :messages
    drop_table :chatroom_users
  end
end
