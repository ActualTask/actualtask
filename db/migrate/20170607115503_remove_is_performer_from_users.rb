class RemoveIsPerformerFromUsers < ActiveRecord::Migration[5.1]
  def down
    remove_column :users, :is_performer, :integer
  end
end
