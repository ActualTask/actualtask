class DropTableMnessages < ActiveRecord::Migration[5.1]
  def change
    drop_table :messages
    drop_table :chat_rooms


  end
end
