class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :moderator, :boolean, default: false
    add_column :users, :performers, :boolean, default: false
  end
end
